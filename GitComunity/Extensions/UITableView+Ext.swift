//
//  UITableView+Ext.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 30.04.2023.
//

import UIKit

extension UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
