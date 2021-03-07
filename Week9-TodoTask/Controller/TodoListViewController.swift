//
//  ViewController.swift
//  Week9-TodoTask
//
//  Created by King Bileygr on 3/1/21.
//

import UIKit
import RealmSwift

class TodoListViewController: UIViewController {
    
    static let reuseidentifier = "todocell"
    
    let myView = UIView()
    let realm = try! Realm()
    var modelCategories = [TodoModel]()
    let DataFunctionsInstance = ModelBusinessLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.7803921569, blue: 0.7803921569, alpha: 1)
        view.addSubview(myView)
        
        reloadData()
        setupViews()
        
        myView.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        myView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.83).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        todoTable.dataSource = self
        todoTable.delegate = self
        todoTable.register(UITableViewCell.self, forCellReuseIdentifier: TodoListViewController.reuseidentifier)
        
    }
    
    override func viewWillLayoutSubviews() {
        viewLayout()
    }
    
    func viewLayout() {
        if modelCategories.count > 0 {
            myView.addSubview(todoTable)
            todoTableConstraints()
            
        }
        if modelCategories.count == 0 {
            todoTable.removeFromSuperview()
            myView.addSubview(myViewLabel)
            myViewLabelConstraints()
        }
        reloadData()
    }
    
    func setupViews() {
        view.addSubview(newTaskLabel)
        view.addSubview(addTaskButton)
        addNewTask()
        layoutConstraints()
    }
    
    func todoTableConstraints() {
        todoTable.heightAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 1.0).isActive = true
        todoTable.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 1.0).isActive = true
    }
    
    func myViewLabelConstraints() {
        myViewLabel.heightAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 1.0).isActive = true
        myViewLabel.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.8).isActive = true
        myViewLabel.centerXAnchor.constraint(equalTo: myView.centerXAnchor).isActive = true
    }
    
    let addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Item", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(#colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1), for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 15)
        button.addTarget(self, action: #selector(addNewTask), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.3695828915, green: 0.1933037043, blue: 0.1874925494, alpha: 1)
        return button
    }()
    
}
