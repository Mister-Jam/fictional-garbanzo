//
//  RealmProtocols.swift
//  Week9-TodoTask
//
//  Created by King Bileygr on 3/3/21.
//

import Foundation
protocol RealmProtocols {
    func deleteTask(category: TodoModel)
    
    func reloadData()
    
    func updateTask(task: String, category: TodoModel)
    
}

