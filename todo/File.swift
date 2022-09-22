//
//  File.swift
//  todo
//
//  Created by 藤井玖光 on 2022/09/22.
//

import Foundation
import RealmSwift

class Grow: Object {
    @objc dynamic var character: String = ""
    @objc dynamic var level: String = ""
}
