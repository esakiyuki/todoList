//
//  Schedule.swift
//  todoList
//
//  Created by esaki yuki on 2020/10/17.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class Schedule: UIButton {
    // Images
    let redImage = UIImage(named: "red")! as UIImage
    let whiteImage = UIImage(named: "white")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(redImage, for: UIControl.State.normal)
            } else {
                self.setImage(whiteImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
