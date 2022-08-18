//
//  CustomAlertController.swift
//  CustomAlertController
//
//  Created by Piesoft on 17/8/2565 BE.
//
import UIKit

struct AlertButton {
    var title: String!
    var action: (() -> Swift.Void)? = nil
    var titleColor: UIColor?
    var backgroundColor: UIColor?
}

struct AlertPayload {
    var title: String!
    var titleColor: UIColor?
    var message: String!
    var messageColor: UIColor?
    var buttons: [AlertButton]!
    var backgroundColor: UIColor?
}

class CustomAlertController: UIViewController {
    
    var payload: AlertPayload!;
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = payload.title
        messageLabel.text = payload.message
        
        if (payload.buttons.count == 2) {
            createButton(uiButton: okButton, alertButton: payload.buttons[0])
            createButton(uiButton: cancelButton, alertButton: payload.buttons[1])
        }
        
        if (payload.backgroundColor != nil) {
            view.backgroundColor = payload.backgroundColor
        }
    }
    
    //MARK: Create custom alert buttons
    private func createButton(uiButton: UIButton, alertButton: AlertButton) {
        uiButton.setTitle(alertButton.title, for: .normal)
        
        if (alertButton.titleColor != nil) {
            uiButton.setTitleColor(alertButton.titleColor, for: .normal)
        }
        if (alertButton.backgroundColor != nil) {
            uiButton.backgroundColor = alertButton.backgroundColor
        }
    }
    
    //MARK: UIButton Actions
    @IBAction func okAction() {
        parent?.dismiss(animated: false, completion: nil);
        payload.buttons.first?.action?()
    }
    
    @IBAction func cancelAction() {
        parent?.dismiss(animated: false, completion: nil);
        payload.buttons[1].action?()
    }
}

