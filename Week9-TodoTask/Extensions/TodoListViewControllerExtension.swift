//
//  TodoListViewControllerExtension.swift
//  Week9-TodoTask
//
//  Created by King Bileygr on 3/2/21.
//

import Foundation
import UIKit

extension TodoListViewController: UITableViewDelegate {
    
    //MARK:- LAYOUT CONSTRAINTS
    
    func layoutConstraints() {
        NSLayoutConstraint.activate([
            addTaskButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40),
            addTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addTaskButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            addTaskButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            newTaskLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40),
            newTaskLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            newTaskLabel.trailingAnchor.constraint(equalTo: addTaskButton.leadingAnchor, constant: -20),
            newTaskLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
        ])
    }
    
    //MARK:- OBJC METHODS
    
    @objc func addNewTask() {
        guard let text = newTaskLabel.text else { return }
        if !text.isEmpty && text.count > 3 {
            
            let newTask = TodoModel()
            DataFunctionsInstance.create(newTask: newTask, of: text)
            customclass.showAlert(imageIcon: UIImageView(image: successImage), message: successMessage, controller: self)
            newTaskLabel.text?.removeAll()
        } else {
//            errorclass.errorPopup(imageIcon: UIImageView(image: errorImage), message: failureMessage, controller: self)

            let controller = UIAlertController(title: "Error", message: "Not a valid input task\nPlease input task with text greater than 3 characters\nThanks", preferredStyle: .alert)
            let alert = UIAlertAction(title: "Close", style: .destructive, handler: nil)
            controller.addAction(alert)
            present(controller, animated: true, completion: nil)
        }
    }
    
    @objc func dismissAlert() {
        customclass.dismissAlert()
    }

    //MARK:- TABLE VIEW DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let category = modelCategories[indexPath.row]
        let editText = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let editAlertAction = UIAlertAction(title: "Edit", style: .default, handler: { _ in
            let alert = UIAlertController(title: "Edit task", message: "Edit your task", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            
            alert.textFields?.first?.text = category.task
            alert.addAction(UIAlertAction(title: "Save Task", style: .cancel, handler: {  _ in
                
                guard let textfield = alert.textFields?.first, let newTask = textfield.text, !newTask.isEmpty else { return }
                self.updateTask(task: newTask, category: category)
                
            }))
            self.present(alert, animated: true, completion: nil)
        })
        
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
        let deleteAlertAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteTask(category: category)
        })
        //
        editText.addAction(cancelAlertAction)
        editText.addAction(deleteAlertAction)
        editText.addAction(editAlertAction)
        //
        present(editText, animated: true, completion: nil)
        
        todoTable.deselectRow(at: indexPath, animated: true)
    }
}

//MARK:- TABLE VIEW DATASOURCE METHODS
extension TodoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTable.dequeueReusableCell(withIdentifier: TodoListViewController.reuseidentifier, for: indexPath)
        let model = modelCategories[indexPath.row]
        cell.textLabel?.text = "\(indexPath.row + 1).   \(model.task)"
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = .white
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let category = modelCategories[indexPath.row]
        let delete = UIContextualAction(style: .normal, title: "Delete") {(action, view, completionHandler) in
            completionHandler(true)
            self.deleteTask(category: category)

        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .systemRed
        
        let swipeAction = UISwipeActionsConfiguration(actions: [delete])
        return swipeAction
    }
}

//MARK:- REALM PROTOCOLS

extension TodoListViewController: RealmProtocols {
    
    func updateTask(task newTask: String, category: TodoModel) {
        
        do {
            try self.realm.write {
                category.task = newTask
                self.realm.add(category)
            }
        } catch {
            print(error)
        }
        self.reloadData()
    }
    
    func deleteTask(category: TodoModel) {
        do {
            try self.realm.write {
                self.realm.delete(category)
            }
        } catch {
            print(error)
        }
        self.reloadData()
        self.viewLayout()
    }
    
    func reloadData() {
        modelCategories = realm.objects(TodoModel.self).map{($0)}
        todoTable.reloadData()
    }
}
