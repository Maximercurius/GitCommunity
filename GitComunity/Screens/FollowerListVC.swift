//
//  FollowerListVC.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 03.10.2022.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentGCAlertOnMainThread(title: "Test", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            print ("Followers.count\(followers.count)")
            print(followers)
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)

    }

}
