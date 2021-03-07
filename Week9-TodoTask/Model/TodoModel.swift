//
//  TodoModel.swift
//  Week9-TodoTask
//
//  Created by King Bileygr on 3/2/21.
//

import Foundation
import RealmSwift

class TodoModel: Object {
    @objc dynamic var task: String = ""
}
