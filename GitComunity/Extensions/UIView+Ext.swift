//
//  UIView+Ext.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 28.04.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
