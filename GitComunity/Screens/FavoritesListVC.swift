//
//  FavoritesListVC.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 02.10.2022.
//

import UIKit

class FavoritesListVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
            
        }
        
    }
}
