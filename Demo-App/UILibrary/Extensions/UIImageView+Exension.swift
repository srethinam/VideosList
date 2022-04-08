//
//  UIImageView+Exension.swift
//  Demo-App
//
//  Created by Saravanan Rethinam.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(from url: String) {
        
        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }
    }
}
