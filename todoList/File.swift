//
//  File.swift
//  todoList
//
//  Created by esaki yuki on 2020/10/02.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import Foundation
import RealmSwift

class Address: Object {
    @objc dynamic var tango: String = ""
//    @objc dynamic var photo: Data? = nil
    @objc dynamic var time: String = ""
    @objc dynamic var deadline: String = ""
}
