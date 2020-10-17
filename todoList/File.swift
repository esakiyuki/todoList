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
    
//    @objc dynamic var Schedule: Bool = false
//    @objc dynamic var Schedule = false
//    let value = RealmOptional<Bool>()
}

class box: Object {
//    @objc dynamic var checkmark: Bool = false
    let checkmark = RealmOptional<Bool>()
}

class TimeTable: Object {
//    @objc dynamic var Schedule: Bool = false
    
//    @objc dynamic var Schedule1: Bool = false
//    @objc dynamic var Schedule2: Bool = false
//    @objc dynamic var Schedule3: Bool = false
//    @objc dynamic var Schedule4: Bool = false
//    @objc dynamic var Schedule5: Bool = false
//    @objc dynamic var Schedule6: Bool = false
//    @objc dynamic var Schedule7: Bool = false
//    @objc dynamic var Schedule8: Bool = false
//    @objc dynamic var Schedule9: Bool = false
//    @objc dynamic var Schedule10: Bool = false
//    @objc dynamic var Schedule11: Bool = false
//    @objc dynamic var Schedule12: Bool = false
//    @objc dynamic var Schedule13: Bool = false
//    @objc dynamic var Schedule14: Bool = false
//    @objc dynamic var Schedule15: Bool = false
//    @objc dynamic var Schedule16: Bool = false
//    @objc dynamic var Schedule17: Bool = false
//    @objc dynamic var Schedule18: Bool = false
//    @objc dynamic var Schedule19: Bool = false
//    @objc dynamic var Schedule20: Bool = false
//    @objc dynamic var Schedule21: Bool = false
//    @objc dynamic var Schedule22: Bool = false
//    @objc dynamic var Schedule23: Bool = false
//    @objc dynamic var Schedule24: Bool = false
//    @objc dynamic var Schedule25: Bool = false
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
