//
//  ViewController.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
//    @IBOutlet var DatePicker: UIDatePicker!
    
    @IBOutlet var tangoTextField: UITextField!
    @IBOutlet var deadlineTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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

