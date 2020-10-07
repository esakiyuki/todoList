//
//  image.swift
//  todoList
//
//  Created by esaki yuki on 2020/10/07.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class image {
    var imageName: String!
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
    func getimage() -> UIImage {
        return UIImage(named: imageName)!
    }
}
