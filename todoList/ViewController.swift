//
//  ViewController.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate, UNUserNotificationCenterDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerView: UIPickerView = UIPickerView()
    let list = ["", "月1", "月2", "月3", "月4", "月5", "火1", "火2", "火3", "火4", "火5", "水1", "水2", "水3", "水4", "水5", "木1", "木2", "木3", "木4", "木5", "金1", "金2", "金3", "金4", "金5"]
    
//    @IBOutlet var DatePicker: UIDatePicker!
    
    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var deadlineTextField: UITextField!
    @IBOutlet var tangoTextField: UITextField!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    let realm = try! Realm()
    
    // 設定に必要なクラスをインスタンス化
//    var notificationTime = DateComponents()
//    var trigger: UNNotificationTrigger!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true

        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ViewController.cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)

        self.timeTextField.inputView = pickerView
        self.timeTextField.inputAccessoryView = toolbar
        
        // Do any additional setup after loading the view.
        
//        if #available(iOS 10.0, *) {
//            // iOS 10
//            let center = UNUserNotificationCenter.current()
//            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
//                if error != nil {
//                    return
//                }
//
//                if granted {
//                    print("通知許可")
//
//                    let center = UNUserNotificationCenter.current()
//                    center.delegate = self
//
//                } else {
//                    print("通知拒否")
//                }
//            })
//
//        } else {
//            // iOS 9以下
//            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
//            UIApplication.shared.registerUserNotificationSettings(settings)
//        }
//
//        // 12時に通知する場合
//        notificationTime.hour = 12
//        notificationTime.minute = 0
//        trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
//
//        // 設定したタイミングを起点として1時間前に通知したい場合
//        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60*60, repeats: false)
//
//        // UNMutableNotificationContentクラスをインスタンス化
//        let content = UNMutableNotificationContent()
//
//        // 通知のメッセージセット
//        content.title = ""
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
        _ = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        _ = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)

        // インプットビュー設定(紐づいているUITextfieldへ代入)
        deadlineTextField.inputView = datePicker
        deadlineTextField.inputAccessoryView = toolbar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.timeTextField.text = list[row]
    }

    @objc func cancel() {
        self.timeTextField.text = ""
        self.timeTextField.endEditing(true)
    }
    
    func finish() {
        self.timeTextField.endEditing(true)
    }

    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
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

