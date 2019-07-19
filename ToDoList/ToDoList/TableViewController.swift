//
//  TableViewController.swift
//  ToDoList
//
//  Created by sunny on 2019/5/22.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var myTask:[String] = []
     @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // tableView有幾個section
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTask.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //  print(myTask.count)
        cell.textLabel?.text = myTask[indexPath.row]
        
        return cell
    }
    
    // MARK: Tableview delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case UITableViewCellEditingStyle.delete:
            myTask.remove(at: indexPath.row)
            listTableView.reloadData()
        default:
            break
        }
    }

    // MARK: - Table view data source

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return cell
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
