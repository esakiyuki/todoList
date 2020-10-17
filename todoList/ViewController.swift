//
//  ViewController.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate, UNUserNotificationCenterDelegate {
    
//    @IBOutlet var DatePicker: UIDatePicker!
    
    @IBOutlet var tangoTextField: UITextField!
    @IBOutlet var deadlineTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    let realm = try! Realm()
    
    // 設定に必要なクラスをインスタンス化
    var notificationTime = DateComponents()
    var trigger: UNNotificationTrigger!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        
        // 12時に通知する場合
        notificationTime.hour = 12
        notificationTime.minute = 0
        trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)

        // 設定したタイミングを起点として1分後に通知したい場合
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
        
        // UNMutableNotificationContentクラスをインスタンス化
        let content = UNMutableNotificationContent()

        // 通知のメッセージセット
        content.title = ""
        content.body = "締め切り間近の課題があります"
        content.sound = UNNotificationSound.default
        
        // 通知スタイルを指定
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
        // 通知をセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
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
    
    @IBAction func saveWord() {
        if tangoTextField.text == "" && deadlineTextField.text == "" && timeTextField.text == "" {
            
        } else {
            let newAddress = Address()
            newAddress.tango = tangoTextField.text!
            newAddress.time = timeTextField.text!
            newAddress.deadline = deadlineTextField.text!
            try! realm.write {
                realm.add(newAddress)
            }
            tangoTextField.text = ""
            timeTextField.text = ""
            deadlineTextField.text = ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

