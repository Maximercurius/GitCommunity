//
//  GCSecondaryTitleLabel.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 21.04.2023.
//

import UIKit

class GCSecondaryTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been imlemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = .systemFont(ofSize: fontSize, weight: .medium)
    }
    
    private func configure() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }


}
