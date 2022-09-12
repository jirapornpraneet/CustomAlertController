//
//  ViewController.swift
//  CustomAlertController
//
//  Created by Piesoft on 16/8/2565 BE.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func alertTapped() {
        let utils = Utils()
        
        let button1 = AlertButton(title: "Yes", action: {
            print("Yes clicked")
        }, titleColor: UIColor.red, backgroundColor: UIColor.clear)
        
        let button2 = AlertButton(title: "No", action: {
            print("No clicked")
        }, titleColor: UIColor.lightGray, backgroundColor: UIColor.clear)
        
        let alertPayload = AlertPayload(title: "Two Button Alert", titleColor: UIColor.red, message: "Are you sure you want to delete?", messageColor: UIColor.green, buttons: [button1, button2], backgroundColor: UIColor.yellow,isImage: true,nameImage: "ic_check")
        
        utils.showAlert(payload: alertPayload, parentViewController: self)
    }
}

