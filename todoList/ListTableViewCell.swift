//
//  ListTableViewCell.swift
//  todoList
//
//  Created by esaki yuki on 2020/09/28.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

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
    var flg = false
    
    @IBAction func check(_ sender: Any) {
        if flg {
            checkBox.setImage(uncheckedImage, for: UIControl.State())
            flg = false
            print("false")
        } else {
            checkBox.setImage(checkedImage, for: UIControl.State())
            flg = true
            print("true")
        }
        
    }

}
