//
//  UIColor+Extenstions.swift
//
//  Created by Saravanan Rethinam
//

import UIKit

public extension UIColor {

    static func brandColor(_ name: String) -> UIColor {
        return UIColor(named: name, in: Bundle(identifier: "com.unntul.DemoApp"), compatibleWith: nil)!
    }
}
