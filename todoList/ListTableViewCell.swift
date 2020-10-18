//
//  ListTableViewCell.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit
import RealmSwift

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var tangoLabel: UILabel!
    @IBOutlet var deadlineLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var checkBox: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    let checkedImage = UIImage(named: "checked")! as UIImage
    let uncheckedImage = UIImage(named: "unchecked")! as UIImage
//    var flg = false
    
    let realm = try! Realm()
    let newbox = box()
    
    @IBAction func check(_ sender: Any) {
        if newbox.checkmark {
            checkBox.setImage(uncheckedImage, for: UIControl.State())
            newbox.checkmark = false
            print("false")
        } else {
            checkBox.setImage(checkedImage, for: UIControl.State())
            newbox.checkmark = true
            print("true")
        }
        
        try! realm.write {
            realm.add(newbox)
        }
        
    }

}
