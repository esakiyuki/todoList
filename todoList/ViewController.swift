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
    
    @IBOutlet var tangoTextField: UITextField!
    @IBOutlet var deadlineTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tangoTextField.delegate = self
        timeTextField.delegate = self
        deadlineTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveWord() {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

