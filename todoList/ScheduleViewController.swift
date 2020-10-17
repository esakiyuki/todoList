//
//  ScheduleViewController.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class ScheduleViewController: UIViewController {
    
    let realm = try! Realm()
//    var Schedule = try! Realm().objects(TimeTable.self)
//    var TimeTable: TimeTable!
    
//    let saveData = UserDefaults.standard
//    var MonDay: [Bool] = [false, false, false, false, false]
//    var TueDay: [Bool] = [false, false, false, false, false]
//    var WedDay: [Bool] = [false, false, false, false, false]
//    var ThuDay: [Bool] = [false, false, false, false, false]
//    var FriDay: [Bool] = [false, false, false, false, false]
    
//    var Schedule = User()
//    var array = ScheduleArray(Schedule.TimeTables)
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var button23: UIButton!
    @IBOutlet weak var button24: UIButton!
    @IBOutlet weak var button25: UIButton!
    
    var buttonArray: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let getMonDay: [Bool] = saveData.array(forKey: "MonDay") as! [Bool]
//        let getTueDay: [Bool] = saveData.array(forKey: "TueDay") as! [Bool]
//        let getWedDay: [Bool] = saveData.array(forKey: "WedDay") as! [Bool]
//        let getThuDay: [Bool] = saveData.array(forKey: "ThuDay") as! [Bool]
//        let getFriDay: [Bool] = saveData.array(forKey: "FriDay") as! [Bool]
        
//        buttonArray = saveData.object(forKey: "tapped") as! [UIButton]
        
//        self.TimeTable = TimeTable()
        
        buttonArray = [button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15, button16, button17, button18, button19, button20, button21, button22, button23, button24, button25]
        
        for i in 0...24 {
            //外枠の色を指定
            (self.buttonArray[i] as AnyObject).layer.borderColor = UIColor.black.cgColor
            //外枠の太さを指定
            (self.buttonArray[i] as AnyObject).layer.borderWidth = 1.0
            buttonArray[i].backgroundColor = UIColor(red: 0.8, green: 0.87, blue: 0.8, alpha: 1.0)
//            buttonArray[i].setImage(whiteImage, for: UIControl.State())
        }
        
//        let MonDay = TimeTable
//        Schedule.TimeTables.append(objectsIn:[false, false, false, false, false])
//        array = ScheduleArray(Schedule.TimeTables)

        // Do any additional setup after loading the view.
    }
    
//    let redImage = UIImage(named: "red")! as UIImage
//    let whiteImage = UIImage(named: "white")! as UIImage
//    var flg = false
    
    @IBAction func tappedButton(_ button: UIButton) {
        if button.backgroundColor == UIColor(red: 0.8, green: 0.87, blue: 0.8, alpha: 1.0) {
            button.backgroundColor = UIColor(red: 1, green: 0.42, blue: 0.36, alpha: 1.0)
        } else {
            button.backgroundColor = UIColor(red: 0.8, green: 0.87, blue: 0.8, alpha: 1.0)
        }
        
        
        
//        saveData.set(buttonArray, forKey: "tapped")
        
//        if flg {
//            for i in 0...24  {
//                buttonArray[i].setImage(redImage, for: UIControl.State())
//                flg = false
//                print("false")
//            }
//        } else {
//            for i in 0...24  {
//                buttonArray[i].setImage(whiteImage, for: UIControl.State())
//                flg = true
//                print("true")
//            }
//        }
        
//        if flg {
//            button1.setImage(whiteImage, for: UIControl.State())
//            flg = false
//            print("false")
//        } else {
//            button1.setImage(redImage, for: UIControl.State())
//            flg = true
//            print("true")
//        }
        
//        if flg {
//            button.backgroundColor = UIColor(red: 0.8, green: 0.87, blue: 0.8, alpha: 1.0)
//            flg = false
//            print("false")
//        } else {
//            button.backgroundColor = UIColor(red: 1, green: 0.42, blue: 0.36, alpha: 1.0)
//            flg = true
//            print("true")
//        }
        
//        let tag = button.tag
//        if tag < 5 {
//            MonDay[tag] = !MonDay[tag]
//        } else if tag <= 5 && tag >= 10 {
//            TueDay[tag] = !TueDay[tag]
//        } else if tag <= 10 && tag >= 15 {
//            WedDay[tag] = !WedDay[tag]
//        } else if tag <= 15 && tag >= 20 {
//            ThuDay[tag] = !ThuDay[tag]
//        } else if tag <= 20 && tag >= 25 {
//            FriDay[tag] = !FriDay[tag]
//        }
        
//        if tag < 5 {
//            TimeTable.MonDay[tag] = !TimeTable.MonDay[tag]
//        } else if tag >= 5 && tag <= 10 {
//            TimeTable.TueDay[tag] = !TimeTable.TueDay[tag]
//        } else if tag >= 10 && tag <= 15 {
//            TimeTable.WedDay[tag] = !TimeTable.WedDay[tag]
//        } else if tag >= 15 && tag <= 20 {
//            TimeTable.ThuDay[tag] = !TimeTable.ThuDay[tag]
//        } else if tag >= 20 && tag <= 25 {
//            TimeTable.FriDay[tag] = !TimeTable.FriDay[tag]
//        }
    }
    
    @IBAction func save() {
        //        let newTimeTable = TimeTable
        //        newTimeTable.MonDay = UIButton!
        //        try! realm.write {
        //            realm.add(newTimeTable)
        //        }
        
//        saveData.set(MonDay, forKey: "MonDay")
//        saveData.set(TueDay, forKey: "TueDay")
//        saveData.set(WedDay, forKey: "WedDay")
//        saveData.set(ThuDay, forKey: "ThuDay")
//        saveData.set(FriDay, forKey: "FriDay")
        
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
