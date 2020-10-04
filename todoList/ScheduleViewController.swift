//
//  ScheduleViewController.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    @IBOutlet var buttonArray: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedButton(_ button: UIButton) {
        //配列でボタンを宣言してると無理？
//        buttonArray.backgroundColor = UIColor.red
    }
    
//    override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//    self.buttonArray.frame = CGRect(x: (self.view.frame.size.width / 2) - 150, y: (self.view.frame.size.height / 2) - 50, width: 300, height: 100)
//    self.buttonArray.backgroundColor = UIColor.red
//
//    //外枠の色を指定
//    self.buttonArray.layer.borderColor = UIColor.gray.cgColor
//
//    //外枠の太さを指定
//    self.buttonArray.layer.borderWidth = 10.0
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
