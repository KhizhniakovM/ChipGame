//
//  Ex+UILabel.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

extension UILabel {
    // Use font in app
    static func makeBangerLabel(withText: String, font: UIFont?, lines: Int) -> UILabel {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        guard let font = font else { return label }
        label.font = font
        label.textColor = .white
        label.text = withText
        label.numberOfLines = lines
        label.textAlignment = .center
        return label
    }
}
