//
//  GCRepoItemVC.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 24.04.2023.
//

import UIKit

class GCRepoItemVC: GCItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
