//
//  ViewController.swift
//  sample_closure
//
//  Created by Syunsuke Nakao on 2019/04/07.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

//Errorの種類分けとそれぞれのエラーメッセージを設定
enum NetworkError: Error {
    case unknown
    case invalidResponse
    case invalidURL
    
    var descriptionString: String {
        switch self {
        case .unknown:
            return "不明なエラーです"
        case .invalidResponse:
            return "不正なレスポンスです"
        case .invalidURL:
            return "不正なURLです"
        }
    }
}

//引数にクロージャを設定するver
//プロパティにクロージャを作る場合は、selfを参照すると循環参照が発生するので注意

class APIClient {
    
    func sendRequest(success: @escaping([String:Any]) -> (),failure: @escaping(Error) -> ()) {
        
        //requestUrlがnilだった場合は、invalidURLのエラーをFailureクロージャに渡して、関数を閉じる
        guard let requestUrl = URL(string: "https://test") else {
            failure(NetworkError.invalidURL)
            return
        }
        
        //URLRequest・Sessionを作成
        let request = URLRequest(url: requestUrl)
        let session = URLSession.shared
        
        //サーバーに対するrequestを実行する
        let task = session.dataTask(with: request) { (data, response, error) in
            
            //もしエラーが出たら、failureクロージャにエラーを渡して処理を終える
            //guardでも書けるが、無駄に変数（スコープ外で使用できる）を作ることになるのでifが良い＆guardの中でlet定数は使えないのでifになる
            if error != nil {
                failure(error!)
                return
            }
            //もしサーバーから何も返ってこなかったら、failureクロージャにunknownエラーを渡して処理を終える
            guard let data = data else {
                failure(NetworkError.unknown)
                return
            }
            //サーバーから返ってきたデータをDictionary型にパースする
            //出来ない場合は、failureクロージャにinvalidResponseエラーを返し処理を終える
            guard let jsonOptional = try? JSONSerialization.jsonObject(with: data, options: []), let json = jsonOptional as? [String:Any] else {
                failure(NetworkError.invalidResponse)
                return
            }
            
            //全て問題なかったら、Successクロージャにjsonを返して処理を終える
            success(json)
            
        }
        
        task.resume()
        
    }
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = APIClient()
        
        api.sendRequest(success: { (json) in
            //正常にjsonが取得できたらここの処理を実行する
        }) { (error) in
            //エラーが出たら、ここの処理を行う
        }
    }

}

//プロパティにクロージャを持つver

class ClosureSamle {
    
    var name: String = ""
    private var printNameClosure: (()->())!
    
    init() {
        
        //printNameClosureの中で、self(ClosureSample)のnameを参照している＆
        //ClosureSampleがprintNameClosureを保持＝参照しているので、循環参照が発生する
        
//        printNameClosure = {
//            print("name = \(self.name)")
//        }
        
        //なので↑ではなく、weakを使ってselfを弱参照にする
        printNameClosure = { [weak self] in
            
            print("name = \(self!.name)")
        
        }
        
    }
    
}
