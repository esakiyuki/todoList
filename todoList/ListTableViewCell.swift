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
//    @IBOutlet var checkBox: CheckBox!
    @IBOutlet var checkBox: UIButton!
//    @IBOutlet var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
