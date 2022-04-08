//
//  TextStyle.swift
//
//  Created by Saravanan Rethinam.
//

import Foundation
import UIKit

/// Text style is the simple struct that has the specifications to set style for text styles.
public struct TextStyle: Equatable {
    
    public var font: UIFont
    public var color: UIColor
    public var textAlignment: NSTextAlignment
    
    /**
     Initializes a new text style with the provided specifications.
     
     - Parameters:
     - style: Style holds the text style specifications.
     
     - Returns: A new action text style with the provided specifications.
     */
    public init(font: UIFont,
                textAlignment: NSTextAlignment = .natural,
                color: UIColor) {
        self.font = font
        self.color = color
        self.textAlignment = textAlignment
    }

    /**
    Required to compare 2 styles  in the consuming app.    UIColor doesn't seem to be Equatable complient.
    It uses some kind of dynamic provider with a different address every time.
    
    - Parameters:
    - lhs: Style1 to be compared.
    - rhs:  Style2 to be compared.

    - Returns: Bool value.
    */
    public static func == (lhs: TextStyle, rhs: TextStyle) -> Bool {
        return
            lhs.font == rhs.font &&
            lhs.color.cgColor == rhs.color.cgColor &&  // Color can have a different address but same cgColor
            lhs.textAlignment == rhs.textAlignment
    }
}

/// Text styles refer to a set of typographical styles which contain a base font
/// as well as additional attributes such as colour, alignment and responsive sizing.
public extension TextStyle {
    
    static var textBody: TextStyle {
        return TextStyle(font: .emphasis14,
                         textAlignment: .natural,
                         color: .textPrimary)
    }
    
    static var finePrint: TextStyle {
        return TextStyle(font: .essential14,
                         textAlignment: .natural,
                         color: .textSecondary)
    }
}
