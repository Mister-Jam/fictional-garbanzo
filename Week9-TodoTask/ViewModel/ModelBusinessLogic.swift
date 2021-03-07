//
//  RealmMethods.swift
//  Week9-TodoTask
//
//  Created by King Bileygr on 3/3/21.
//

import UIKit
import RealmSwift

class ModelBusinessLogic {
    
    let realm = try! Realm()
    var modelCategories = [TodoModel]()
    
    
    func addTask(category: TodoModel) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print(error)
        }
        
    }

    func create(newTask: TodoModel, of text: String) {
        newTask.task = text
        self.modelCategories.append(newTask)
        addTask(category: newTask)
        todoTable.reloadData()
    }
    
    
    
    

}



