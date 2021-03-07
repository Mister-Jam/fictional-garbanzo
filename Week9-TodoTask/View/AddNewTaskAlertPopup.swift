//
//  AlertView.swift
//  Week9-TodoTask
//
//  Created by King Bileygr on 3/2/21.
//

import Foundation
import UIKit

class AddNewTaskAlertPopup {
    
    struct AlphaNumber {
        static let backgroundAlphaNumber: CGFloat = 0.6
    }
    
    private var ourPopup: UIView?
    
    private let alertBackgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.8705882353, blue: 0.8039215686, alpha: 1)
        backgroundView.alpha = 0
        
        return backgroundView
        
    }()
    
    private let alertView: UIView = {
        let alertView = UIView()
        alertView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alertView.layer.masksToBounds = true
        alertView.layer.cornerRadius = 8
        
        return alertView
        
    }()
    
    func showAlert(imageIcon: UIImageView, message: String, controller: UIViewController) {
        guard let popupView = controller.view else { return }
        ourPopup = popupView

        alertBackgroundView.frame = popupView.bounds
        popupView.addSubview(alertBackgroundView)
        popupView.addSubview(alertView)
        
        alertView.frame = CGRect(x: 40, y: -300, width: popupView.frame.size.width - 40, height: 300)
        let titleLabel = UILabel()
        titleLabel.text = "Success"
        alertView.addSubview(titleLabel)
        
        let userImage = UIImageView()
        userImage.image = #imageLiteral(resourceName: "Success")
        userImage.frame = CGRect(x: 25, y: 0, width: alertView.frame.size.width - 80, height: 120)
        userImage.clipsToBounds = true
        
        userImage.contentMode = .scaleAspectFit
        alertView.addSubview(userImage)
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 80, width: alertView.frame.size.width - 40, height: 170))
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.clipsToBounds = true
        alertView.addSubview(messageLabel)
        
        let attributedText = NSMutableAttributedString(string: "\n\(titleLabel.text ?? " ")", attributes: [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.foregroundColor: color])
        attributedText.append(NSAttributedString(string: "\n\n\(messageLabel.text ?? " ")", attributes: [NSAttributedString.Key.font: font1 as Any, NSAttributedString.Key.foregroundColor: color]))

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let len = attributedText.string.count
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: _NSRange(location: 0, length: len))
        messageLabel.attributedText = attributedText
        
        let buttonView = UIButton(frame: CGRect(x: 0, y: alertView.frame.size.height - 50, width: alertView.frame.size.width, height: 50))
        buttonView.setTitle("Dismiss", for: .normal)
        buttonView.titleLabel?.font = UIFont(name: "Avenir Next Medium Italic", size: 20)
        buttonView.setTitleColor(.systemGreen, for: .normal)
        buttonView.isEnabled = true
        buttonView.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        alertView.addSubview(buttonView)
        
        UIView.animate(withDuration: 0.5, animations: { self.alertBackgroundView.alpha = AlphaNumber.backgroundAlphaNumber }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, animations: {
                    self.alertView.center = popupView.center
                }, completion: nil)
            }
        } )

    
    }
    
    @objc func dismissAlert() {
        guard let popupView = ourPopup else { return }
        UIView.animate(withDuration: 0.2, animations: { self.alertView.frame = CGRect(x: 40, y: popupView.frame.size.height, width: popupView.frame.size.width - 40, height: 300 ) }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.2, animations: { self.alertBackgroundView.alpha = 0 }, completion: { done in
                    if done {
                        self.alertBackgroundView.removeFromSuperview()
                        self.alertView.removeFromSuperview()
                    }
                })
            }
        })
        
    }

}
