//
//  UIViewController+Ext.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 04.10.2022.
//

import UIKit
import SafariServices

fileprivate var containerView: UIView!



extension UIViewController {
    
    func presentGCAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GCAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha  = 0.8
        }
        let activityindicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityindicator)
        
        activityindicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityindicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityindicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        activityindicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async{
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyStateView(message: String, in view: UIView) {
        let emptyStateView = GCEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
    
}
