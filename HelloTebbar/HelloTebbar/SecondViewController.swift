//
//  SecondViewController.swift
//  HelloTebbar
//
//  Created by sunny on 2019/5/10.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var infoFromViewOne: String?
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var SecondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = infoFromViewOne
        self.title = "加入待辦事項"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func GoToView1(_ sender: UIButton) {
        let test = tabBarController?.viewControllers?[0] as? UINavigationController
        let firstView = test?.topViewController as? FirstViewController
        firstView?.FirstLabel.text = SecondTextField.text
        tabBarController?.selectedIndex = 0
    }
}

