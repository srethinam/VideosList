//
//  UIFont+Extenstions.swift
//
//  Created by Saravanan Rethinam
//

import UIKit

extension UIFont {

    public enum FontStyle {
        static let size16: CGFloat = 16.0
        static let size14: CGFloat = 14.0

        case accented, emphasis, essential, minimal
    }

    // MARK: - font names

    public class var emphasis14: UIFont { return scaledFont(size: FontStyle.size14, style: .emphasis) }
    public class var essential14: UIFont { return scaledFont(size: FontStyle.size14, style: .essential) }

    /**
     Returns a scaled font based on the given font size and weight.
     
     - Parameters:
     - size: font size.
     - style: style represents the weight.
     
     - Returns: UIFont object with UIFontMetrics scaled font.
     */
    public class func scaledFont(size: CGFloat, style: FontStyle) -> UIFont {

        // checks for the font weight first
        var weight: UIFont.Weight = .regular

        switch style {
        case .emphasis: weight = .bold
        case .essential: weight = .regular
        case .minimal: weight = .light
        case .accented: weight = .semibold
        }

        // construct based on size
        let baseFont = UIFont.systemFont(ofSize: size, weight: weight)
        switch size {
        case FontStyle.size14:
            return UIFontMetrics(forTextStyle: .caption1).scaledFont(for: baseFont)
        case FontStyle.size16:
            return UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: baseFont)
        default:
            return UIFontMetrics.default.scaledFont(for: baseFont)
        }
    }
}
