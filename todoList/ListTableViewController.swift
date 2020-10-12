//
//  ListTableViewController.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class ListTableViewController: UITableViewController {
    
//    @IBOutlet var tableView: UITableView!
    
//    var wordArray: [Dictionary<String, String>] = []
//    let saveData = UserDefaults.standard
    
    let realm = try! Realm()
    var addresses = try! Realm().objects(Address.self)
    
//    var imageArray: [image] = []
//    var imageArray = [String]()
    let image = UIImage(named: "checked")

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageArray = ["checked", "unchecked"]
//        imageArray.append(image(imageName: "checked"))
//        imageArray.append(image(imageName: "unchecked"))
//        imageView.image = imageArray[0].getimage()
        
        tableView.delegate = self
        tableView.dataSource = self
        print(Realm.Configuration.defaultConfiguration.fileURL!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        if saveData.array(forKey: "WORD") != nil {
//            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
//        }
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return wordArray.count
        return addresses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
//        let nowIndexPathDictionary = wordArray[indexPath.row]
        cell.tangoLabel.text = addresses[indexPath.row].tango
        cell.timeLabel.text = addresses[indexPath.row].time
        cell.deadlineLabel.text = addresses[indexPath.row].deadline
//        cell.tangoLabel.text = nowIndexPathDictionary["tango"]
        cell.selectionStyle = .none
        
//        cell.checkBox.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.accessoryType = .checkmark
//        cell?.backgroundColor = .red
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
//        cell?.imageView?.image = UIImage(named: imageArray[indexPath.row])
//        cell.img.image = UIImage(named: imageArray[indexPath.row])
        
//        cell.checkBox?.setImage(UIImage(contentsOfFile: imageArray[indexPath.row]), for: .normal)
        cell.checkBox?.setImage(image, for: .normal)
//        cell.checkBox?.setImage = UIImage(named: imageArray[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.accessoryType = .none
//        cell?.backgroundColor = .clear
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
        cell.checkBox?.setImage(image, for: .normal)
    }
    
    // セルの編集許可
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    // スワイプ削除
    func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    //スワイプしてセルを消去
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
//            wordArray.remove(at: indexPath.row)
            
            // これはRealmSwiftでデータを削除しているケース
            let deleteaddresses = self.addresses[indexPath.row]
//            let deleteaddresses = realm.objects(addresses.self)
            // Realmのデータ削除
            try! realm.write {
                realm.delete(deleteaddresses)
            }
            // テーブルのデータ削除
            //            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            // TableViewを再読み込み
            self.tableView.reloadData()
            
        }
    }
    
//    @IBAction func buttonClicked() {
//        cell.checkBox.image = UIImage(named: "checked")! as UIImage
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
