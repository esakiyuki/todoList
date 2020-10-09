//
//  File.swift
//  todoList
//
//  Created by esaki yuki on 2020/10/02.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Address: Object {
    @objc dynamic var tango: String = ""
//    @objc dynamic var photo: Data? = nil
    @objc dynamic var time: String = ""
    @objc dynamic var deadline: String = ""
}

class TimeTable: Object {
    @objc dynamic var MonDay = [false, false, false, false, false]
    @objc dynamic var TueDay = [false, false, false, false, false]
    @objc dynamic var WedDay = [false, false, false, false, false]
    @objc dynamic var ThuDay = [false, false, false, false, false]
    @objc dynamic var FriDay = [false, false, false, false, false]
}
