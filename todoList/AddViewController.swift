//
//  AddViewController.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var tangoTextField: UITextField!
    @IBOutlet var deadlineTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    
//    var wordArray: [Dictionary<String, String>] = []
    
//    let saveData = UserDefaults.standard
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tangoTextField.delegate = self
        timeTextField.delegate = self
        deadlineTextField.delegate = self
        
//        if saveData.array(forKey: "WORD") != nil {
//            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
//        }
        
        // Do any additional setup after loading the view.
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
//        let wordDictionary = ["tango": tangoTextField.text!]
//        wordArray.append(wordDictionary)
//        saveData.set(wordArray, forKey: "WORD")
        tangoTextField.text = ""
        timeTextField.text = ""
        deadlineTextField.text = ""
        self.navigationController?.popViewController(animated: true)
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
