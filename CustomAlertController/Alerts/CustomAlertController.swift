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
    var title: String = ""
    var titleColor: UIColor = .black
    var message: String = ""
    var messageColor: UIColor = .black
    var buttons: [AlertButton]!
    var backgroundColor: UIColor = .white
    var isImage = false
    var nameImage = ""
}

class CustomAlertController: UIViewController {
    
    var payload: AlertPayload!;
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var checkImageView: UIImageView!
    @IBOutlet weak var viewTitleHeight: NSLayoutConstraint!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = payload.title
        messageLabel.text = payload.message
        checkImageView.isHidden = !payload.isImage
        viewTitleHeight.constant = 0.6
        viewHeight.constant = 150
        view.backgroundColor = payload.backgroundColor
        
        if payload.isImage {
            checkImageView.image = UIImage(named: payload.nameImage)
            viewTitleHeight.constant = 0.75
            viewHeight.constant = 200
            
        }
        
        if payload.buttons.count == 1 {
            cancelButton.isHidden = true
            okButton.setTitleColor(payload.buttons[0].titleColor, for: .normal)
        } else if (payload.buttons.count == 2) {
            okButton.setTitleColor(payload.buttons[0].titleColor, for: .normal)
            cancelButton.setTitleColor(payload.buttons[1].titleColor, for: .normal)
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

