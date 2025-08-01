//
//  UIImageView+Extension.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 01/08/25.
//

import Foundation
import UIKit

extension UIImageView {
    static func appLogo() -> UIImageView {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Logo")
        img.contentMode = .scaleAspectFit
        return img
    }
}
