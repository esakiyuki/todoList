//
//  AddViewController.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate, UNUserNotificationCenterDelegate {
    
    @IBOutlet var tangoTextField: UITextField!
    @IBOutlet var deadlineTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    let realm = try! Realm()
    
    
//    // 設定に必要なクラスをインスタンス化
//    var notificationTime = DateComponents()
//    var trigger: UNNotificationTrigger!

    override func viewDidLoad() {
        super.viewDidLoad()

//        // 12時に通知する場合
//        notificationTime.hour = 12
//        notificationTime.minute = 0
//        trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
////        trigger = UNCalendarNotificationTrigger(dateMatching: datePicker, repeats: false)
//
//        // 設定したタイミングを起点として1時間前に通知したい場合
//        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60*60, repeats: false)
//        
//        // UNMutableNotificationContentクラスをインスタンス化
//        let content = UNMutableNotificationContent()
//
//        // 通知のメッセージセット
//        content.title = ""
////        content.body = "締め切り一時間前の課題があります"
//        content.body = "締め切り間近の課題があります"
//        content.sound = UNNotificationSound.default
//        
//        // 通知スタイルを指定
//        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
//        // 通知をセット
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        tangoTextField.delegate = self
        timeTextField.delegate = self
        deadlineTextField.delegate = self
        
//        datePicker.minuteInterval = 30;
                
        // ピッカー設定
        //        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        deadlineTextField.inputView = datePicker
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        // インプットビュー設定(紐づいているUITextfieldへ代入)
        deadlineTextField.inputView = datePicker
        deadlineTextField.inputAccessoryView = toolbar
        
        // Do any additional setup after loading the view.
    }
    
    @objc func done() {
        deadlineTextField.endEditing(true)
        
        // 日付のフォーマット
        let formatter = DateFormatter()
        
        //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
        //        formatter.dateFormat = "yyyy年MM月dd日"
        formatter.dateFormat = "MM/dd HH:mm"
        
        //(from: datePicker.date))を指定してあげることで
        //datePickerで指定した日付が表示される
        deadlineTextField.text = "\(formatter.string(from: datePicker.date))"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveWord() {
        let newAddress = Address()
        newAddress.tango = tangoTextField.text!
        newAddress.time = timeTextField.text!
        newAddress.deadline = deadlineTextField.text!
        //        try! realm.write {
        //            realm.add(newAddress)
        //        }
        //        tangoTextField.text = ""
        //        timeTextField.text = ""
        //        deadlineTextField.text = ""
        //        self.navigationController?.popViewController(animated: true)
        
        if tangoTextField.text == "" || deadlineTextField.text == "" || timeTextField.text == "" {
            let alert = UIAlertController(
                title: "保存できません",
                message: "すべての項目に入力してください",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
        } else {
            try! realm.write {
                realm.add(newAddress)
            }
            self.navigationController?.popViewController(animated: true)
        }
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
