//
//  GCFollowerItemVC.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 24.04.2023.
//

import UIKit

protocol GCFollowerItemVCDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

class GCFollowerItemVC: GCItemInfoVC {
    
    weak var delegate: GCFollowerItemVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemGreen, title: "GitHub GetFollowers", systemImageName: "person.3")
    }
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
