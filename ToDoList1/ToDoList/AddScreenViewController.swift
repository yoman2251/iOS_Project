//
//  AddScreenViewController.swift
//  ToDoList
//
//  Created by sunny on 2019/5/22.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class AddScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SaveButton(_ sender: UIBarButtonItem) {
        // save something
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
