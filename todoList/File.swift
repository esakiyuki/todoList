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

//class TimeTable: Object {
//    @objc dynamic var MonDay = [false, false, false, false, false]
//    @objc dynamic var TueDay = [false, false, false, false, false]
//    @objc dynamic var WedDay = [false, false, false, false, false]
//    @objc dynamic var ThuDay = [false, false, false, false, false]
//    @objc dynamic var FriDay = [false, false, false, false, false]
//}

//class User: Object {
//    let TimeTables = List<TimeTable>()
//}

//class TimeTable: Object {
//    @objc dynamic var MonDay = Data()
//    @objc dynamic var TueDay = Data()
//    @objc dynamic var WedDay = Data()
//    @objc dynamic var ThuDay = Data()
//    @objc dynamic var FriDay = Data()
//        @objc dynamic var MonDay = [false, false, false, false, false]
//        @objc dynamic var TueDay = [false, false, false, false, false]
//        @objc dynamic var WedDay = [false, false, false, false, false]
//        @objc dynamic var ThuDay = [false, false, false, false, false]
//        @objc dynamic var FriDay = [false, false, false, false, false]
//    let users = LinkingObjects(fromType: User.self, property: "TimeTables")
//}

//do {
//    let realm = try Realm()
//    let schedule: [String: Any] = [false, false, false, false, false]
//}
