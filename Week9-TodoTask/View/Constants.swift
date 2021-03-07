//
//  Constants.swift
//  Week9-TodoTask
//
//  Created by King Bileygr on 3/3/21.
//

import Foundation
import UIKit

public var completionHandler: (()-> Void)?
let customclass = AddNewTaskAlertPopup()
let errorclass = ErrorAlert()
let color = #colorLiteral(red: 0.3695828915, green: 0.1933037043, blue: 0.1874925494, alpha: 1)
let font = UIFont(name: "Courier New Bold", size: 25)
let font1 = UIFont(name: "Chalkduster", size: 16)
let errorFont = UIFont(name: "Helvetica Bold", size: 25)
let errorMessage = UIFont(name: "Apple SD Gothic Neo Bold", size: 16)
let errorTextColor = #colorLiteral(red: 0.6470588235, green: 0.1647058824, blue: 0.1647058824, alpha: 1)
let successImage = #imageLiteral(resourceName: "Success")
let errorImage = #imageLiteral(resourceName: "Error")
let successMessage = "You have successfully saved a new task"
let failureMessage = "Not a valid input task\nPlease input task with text greater than 3 characters\nThanks"
