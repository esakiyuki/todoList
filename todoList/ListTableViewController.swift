//
//  ListTableViewController.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class ListTableViewController: UITableViewController, UNUserNotificationCenterDelegate {
    
    let realm = try! Realm()
    var addresses = try! Realm().objects(Address.self)
    
    //    sortedメソッドを使用することで取得結果を並べ替えることができる
    //    let 結果格納用変数 = realm.objects(モデルクラス名.self).sorted(byKeyPath: "プロパティ", ascending: Bool値)
    //    let results = Realm.objects(Address.self).sorted(byKeyPath: "", ascending: Bool)
    
    // 設定に必要なクラスをインスタンス化
    var notificationTime = DateComponents()
    var trigger: UNNotificationTrigger!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スワイプ消去と並び替え機能は併用できない？
        //        tableView.isEditing = true
        //        tableView.allowsSelectionDuringEditing = true
        
        if #available(iOS 10.0, *) {
            // iOS 10
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                
                if granted {
                    print("通知許可")
                    
                    let center = UNUserNotificationCenter.current()
                    center.delegate = self
                    
                } else {
                    print("通知拒否")
                }
            })
            
        } else {
            // iOS 9以下
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        
        if addresses.count >= 1 {
            
            // 12時に通知する場合
            notificationTime.hour = 12
            notificationTime.minute = 0
            trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
            
            // 設定したタイミングを起点として1分後に通知したい場合
            //        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60*60, repeats: false)
            
            // UNMutableNotificationContentクラスをインスタンス化
            let content = UNMutableNotificationContent()
            
            // 通知のメッセージセット
            content.title = ""
            content.body = "完了していない課題があります"
            content.sound = UNNotificationSound.default
            
            // 通知スタイルを指定
            let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
            // 通知をセット
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
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
        cell.tangoLabel.text = addresses[indexPath.row].tango
        cell.timeLabel.text = addresses[indexPath.row].time
        cell.deadlineLabel.text = addresses[indexPath.row].deadline
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
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
