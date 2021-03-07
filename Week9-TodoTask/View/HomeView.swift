//
//  HomeView.swift
//  Week9-TodoTask
//
//  Created by King Bileygr on 3/3/21.
//

import Foundation
import UIKit

let todoTable: UITableView = {
    
    let tableview = UITableView(frame: .zero, style: .plain)
    tableview.allowsSelection = true
    tableview.translatesAutoresizingMaskIntoConstraints = false
    tableview.backgroundColor = .white
    tableview.isScrollEnabled = true
    
    return tableview
}()

let newTaskLabel: PaddingText = {
    let newTask = PaddingText()
    newTask.placeholder = "Add new task"
    newTask.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    newTask.layer.cornerRadius = 8
    newTask.clipsToBounds = true
    newTask.translatesAutoresizingMaskIntoConstraints = false
    return newTask
}()


let myViewLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "You do not have an item yet...\n\n\nGo on, add an item"
    label.textAlignment = .center
    label.textColor = #colorLiteral(red: 0.2941176471, green: 0.1411764706, blue: 0.1411764706, alpha: 1)
    label.numberOfLines = 0
    label.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 40)
    return label
    
}()


