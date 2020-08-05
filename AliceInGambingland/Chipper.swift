//
//  Chipper.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 30.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

class Chipper {
    
    // MARK: - Methods
    func makeChip(of color: Color) -> UIImage {
        let image: UIImage? = color == .white ? Constants.whiteChip : Constants.redChip
        guard let resultImage = image else { return UIImage() }
        return resultImage
    }
    
    func makePlayerColor(of color: Color) -> UIImage {
        var image: UIImage?
        switch color {
        case .red:
            image = UIImage(named: "RedColor")
        case .white:
            image = UIImage(named: "WhiteColor")
        }
        guard let resultImage = image else { return UIImage() }
        return resultImage
    }
    
}
