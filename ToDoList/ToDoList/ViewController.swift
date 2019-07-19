//
//  ViewController.swift
//  ToDoList
//
//  Created by sunny on 2019/5/22.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var myTask:[String] = []
    
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        listTableView.dataSource = self
//        listTableView.delegate = self
//
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Save / Cancel 提示框
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "輸入待辦事項",
            message: nil,
            preferredStyle: .alert)
        
        
        // 建立[Save]按鈕
        let okAction = UIAlertAction(
            title: "Save",
            style: .default,
            handler: {
                (action: UIAlertAction!) -> Void in
                let things =
                    (alertController.textFields?[0])! as UITextField

                self.myTask.append(things.text!)
                self.saveData()
                things.text = ""
                self.listTableView.reloadData()
            
                print("things    = \(things.text!)")
                //* 繼續處理帳密認證 ...
        
            }
            
        )
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        alertController.addAction(cancelAction)
        
        
        //輸入欄位
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "輸入待辦事項"
        }
       
        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)
    
    }

    func saveData() {
        UserDefaults.standard.set(myTask, forKey: "myTask")
    }
    
    func loadData() {
        myTask = UserDefaults.standard.stringArray(forKey: "myTask") ?? []
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // tableView有幾個section
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      //  print(myTask.count)
        cell.textLabel?.text = myTask[indexPath.row]
        
        return cell
    }
    
    // MARK: Tableview delegate
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case UITableViewCellEditingStyle.delete:
            myTask.remove(at: indexPath.row)
            listTableView.reloadData()
        default:
            break
        }
    }

    
    

}
