//
//  GCFollowerItemVC.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 24.04.2023.
//

import UIKit

class GCFollowerItemVC: GCItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "GitHub GetFollowers")
    }
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
