//
//  ViewController.swift
//  Sample
//
//  Created by sunny on 2019/5/10.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
    }


}

class GreenViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green   // self.view.backgroundColor = UIColor.green
    }
}

class BlueViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue   // self.view.backgroundColor = UIColor.green
    }
}

