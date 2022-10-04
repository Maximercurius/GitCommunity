//
//  UIViewController+Ext.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 04.10.2022.
//

import UIKit


extension UIViewController {
    
    func presentGCAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GCAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
