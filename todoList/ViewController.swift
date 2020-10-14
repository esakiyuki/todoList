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
    
    @IBOutlet var DatePicker: UIDatePicker!
//    let datePicker: UIDatePicker = {
//        let dp = UIDatePicker()
//        dp.datePickerMode = UIDatePicker.Mode.dateAndTime
//        dp.timeZone = NSTimeZone.local
//        dp.locale = Locale.current
//        dp.addTarget(self, action: #selector(dateChange), for: .valueChanged)
//        return dp
//    }()
//
//    @objc func dateChange(){
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM/dd hh:mm"
//        timeLimitTextField.text = "\(formatter.string(from: datePicker.date))"
//    }
//
//    func textField(_ textField: UITextField,
//                   shouldChangeCharactersIn range: NSRange,
//                   replacementString string: String) -> Bool {
//        // キーボード入力や、カット/ペースによる変更を防ぐ
//        return false
//    }
//
//    let timeTextField = UITextField()
    
    @IBOutlet var tangoTextField: UITextField!
    @IBOutlet var deadlineTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DatePicker.minuteInterval = 30;
//        timeTextField.inputView = datePicker
//        timeLimitTextField.delegate = self
        
        tangoTextField.delegate = self
        timeTextField.delegate = self
        deadlineTextField.delegate = self
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

