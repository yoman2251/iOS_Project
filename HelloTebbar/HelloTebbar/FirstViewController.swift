//
//  FirstViewController.swift
//  HelloTebbar
//
//  Created by sunny on 2019/5/10.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var FirstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "待辦事項列表"
        // Do any additional setup after loading the view.
    }

    @IBAction func GoToView2(_ sender: UIButton) {
        let secondView = tabBarController?.viewControllers?[1] as? SecondViewController
        secondView?.infoFromViewOne = myTextField.text
       
        tabBarController?.selectedIndex = 1     // 轉換場景
    }
    
    
    
}

