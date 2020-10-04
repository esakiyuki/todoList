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
    
//    var wordArray: [Dictionary<String, String>] = []
    
//    let saveData = UserDefaults.standard
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tangoTextField.delegate = self
        
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
        try! realm.write {
            realm.add(newAddress)
        }
//        let wordDictionary = ["tango": tangoTextField.text!]
//        wordArray.append(wordDictionary)
//        saveData.set(wordArray, forKey: "WORD")
        tangoTextField.text = ""
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
