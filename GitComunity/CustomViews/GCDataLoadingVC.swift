//
//  GCDataLoadingVC.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 27.04.2023.
//

import UIKit

class GCDataLoadingVC: UIViewController {
    
    var containerView: UIView!

    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            self.containerView.alpha  = 0.8
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
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    func showEmptyStateView(message: String, in view: UIView) {
        let emptyStateView = GCEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
