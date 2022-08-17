//
//  Utils.swift
//  CustomAlertController
//
//  Created by Piesoft on 17/8/2565 BE.
//

import UIKit

class Utils {
    
    func showAlert(payload: AlertPayload, parentViewController: UIViewController) {
        var customAlertController: CustomAlertController!;
        if (payload.buttons.count == 1) {
            customAlertController = self.instantiateViewController(storyboardName: "Alerts", viewControllerIdentifier: "OneButtonAlert") as! CustomAlertController;
        }
        else if (payload.buttons.count == 2) {
            customAlertController = self.instantiateViewController(storyboardName: "Alerts", viewControllerIdentifier: "TwoButtonAlert") as! CustomAlertController;
        }
        else {
            // Action not supported
            return;
        }
        customAlertController?.payload = payload;
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert);
        alertController.setValue(customAlertController, forKey: "contentViewController");
        parentViewController.present(alertController, animated: true, completion: nil);
    }
    
    public func instantiateViewController(storyboardName: String, viewControllerIdentifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main);
        return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier);
    }
}
