//
//  ViewController.swift
//  ToDoList
//
//  Created by sunny on 2019/5/17.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let fruits = ["apple", "banana", "kiwi", "watermelon"]
    let animals = ["cat", "dog", "bird", "lion"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // tableView有幾個section
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 每個section要有幾個row
        if section == 0 {
            return fruits.count
        } else {
            return animals.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //每個cell的資訊
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //看看有沒有可以回收的cell
        //let cell = UITableViewCell() 不要這樣寫
        if indexPath.section == 0 {
            cell.textLabel?.text = fruits[indexPath.row]
        } else {
            cell.textLabel?.text = animals[indexPath.row]
        }

        return cell;
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Fruits"
        } else {
            return "Animals"
        }
    }

}
