//
//  index.swift
//  todo
//
//  Created by 藤井玖光 on 2022/09/06.
//

import Foundation
import RealmSwift

class Memo: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    //@objc dynamic var date: String = ""
}

