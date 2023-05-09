//
//  UIViewController+Ext.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 04.10.2022.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func presentGCAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = GCAlertVC(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle  = .overFullScreen
        alertVC.modalTransitionStyle    = .crossDissolve
        present(alertVC, animated: true)
    }
    
    func presentDefaultError() {
        let alertVC = GCAlertVC(title: "Something went wrong",
                                message: "Unable to complete task",
                                buttonTitle: "Ok")
        alertVC.modalPresentationStyle  = .overFullScreen
        alertVC.modalTransitionStyle    = .crossDissolve
        present(alertVC, animated: true)
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
}
