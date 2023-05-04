//
//  GCUserInfoVC.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 19.04.2023.
//

import UIKit

protocol UserVCDelegate: AnyObject {
    func didRequestFollowers(for username: String)
}

class GCUserInfoVC: GCDataLoadingVC {
    
    let scrollView  = UIScrollView()
    let contentView = UIView()
    
    let headerView  = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel   = GCBodyLabel(textAlignment: .center)
    
    var itemViews:[UIView] = []
    var userName: String!
    weak var delegate: UserVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureScrollView()
        getUserInfo()
        layoutUI()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 600)
        ])

        
    }
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: userName) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(with: user)
                }
            case .failure(let error):
                self.presentGCAlertOnMainThread(title: "warning", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureUIElements(with user: User) {
        let repoItemVC = GCRepoItemVC(user: user)
        repoItemVC.delegate = self
        
        let followerItemVC = GCFollowerItemVC(user: user)
        followerItemVC.delegate = self
        
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.dateLabel.text = "GitHub since\(user.createdAt.convertToMonthYearFormat())"
        self.add(childVC: GCUserInfoHeaderVC(user: user), to: self.headerView)

    }
    
    func layoutUI() {
        let padding:CGFloat = 20
        let itemHeight:CGFloat = 140
        
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        
        for itemView in itemViews {
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}

extension GCUserInfoVC: GCRepoItemVCDelegate {
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGCAlertOnMainThread(title: "Invalid URL", message: "The url attached for this user is invalid.", buttonTitle: "Ok")
            return
        }
        presentSafariVC(with: url)
    }
}

extension GCUserInfoVC: GCFollowerItemVCDelegate {
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGCAlertOnMainThread(title: "No Followers", message: "This user has no followers.😔", buttonTitle: "Ok")
            return
        }
        delegate.didRequestFollowers (for: user.login)
        dismissVC()
    }
}
