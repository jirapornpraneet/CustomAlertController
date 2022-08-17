//
//  Utils.swift
//  CustomAlertController
//
//  Created by Piesoft on 17/8/2565 BE.
//

import UIKit

class Utils {
    
    func showAlert(payload: AlertPayload, parentViewController: UIViewController) {
        let customAlertController = self.instantiateViewController(storyboardName: "Alerts", viewControllerIdentifier: "CustomAlertController") as! CustomAlertController
        customAlertController.payload = payload
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alertController.setValue(customAlertController, forKey: "contentViewController")
        parentViewController.present(alertController, animated: true, completion: nil)
    }
    
    public func instantiateViewController(storyboardName: String, viewControllerIdentifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
    }
}
