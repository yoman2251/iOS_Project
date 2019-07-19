//
//  ViewController.swift
//  HelloWeb
//
//  Created by sunny on 2019/5/31.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let myWebView1 = WKWebView(frame: <#T##CGRect#>)
        // 網址
        let address = "https://www.apple.com"
        // 網址變成url
        if let url = URL(string: address) {
            // URL -> URLRequest
            let request = URLRequest(url: url)
            myWebView.load(request)
        }

    }
}

