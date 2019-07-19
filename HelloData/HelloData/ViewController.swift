//
//  ViewController.swift
//  HelloData
//
//  Created by sunny on 2019/6/5.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 下載網址
        let address = "https://randomuser.me/api/"
        
        /* 用Data下載
        // 網址產生URL
        if let url = URL(string: address) {
            // 到共時佇列下載
            DispatchQueue.global().async {
                do {
                    // 用 Data 類別下載圖片
                    let downloadData = try Data(contentsOf: url)
                    // 下載完畢，回到主要佇列更改圖片
                    DispatchQueue.main.async {
                        // 用data產生圖片，把圖片用image view 產生圖片秀出
                        self.myImageView.image = UIImage(data: downloadData)
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
            }
        }*/
        // 產生 URL
        if let url = URL(string: address) {
            // 產生 URLSession
            let session = URLSession(configuration: .default)
            // 產生 task
            let task = session.dataTask(with: url) { (data, response, error) in
                // 如果有錯誤，不要再執行
                if error != nil {
                    // 可以寫alert跳出錯誤訊息
                    print("wrong")
                    return
                }
                if let okData = data {
                    do {
                        // 變成可以用的 JSON 資料
                        if let json = try JSONSerialization.jsonObject(with: okData, options: []) as? [String:Any] {
                            if let myResult = json["results"] as? [[String:Any]] {
                                if let joke = myResult[0]["email"] as? String {
                                    print(joke)
                                }
                            }
                        }
                        
                    }catch {
                        
                    }
                    
                }
            }
            // 開始下載
            task.resume()
        }
        
    }


}

