//
//  DSLabel.swift
//
//  Created by Saravanan Rethinam.
//

import UIKit

open class DSLabel: UILabel {
    
    public var style: TextStyle?

    convenience init() {
        self.init(frame: .zero)
    }
    
    public convenience init(_ style: TextStyle, hyphenated: Bool = false) {
        self.init()
        setStyle(style)
        super.numberOfLines = .zero
    }
    
    // Empty setter is required here to make it unavailable outside the framework
    override open var font: UIFont? {
        get {
            return super.font
        }
        @available(*, unavailable)
        set { }
    }
    
    override open var textAlignment: NSTextAlignment {
        get {
            return super.textAlignment
        }
        @available(*, unavailable)
        set { }
    }
    
    override open var textColor: UIColor? {
        get {
            return super.textColor
        }
        @available(*, unavailable)
        set { }
    }
    
    /// Set style parameters with the defined values.
    func setStyle(_ style: TextStyle) {
        self.style = style
        super.font = style.font
        super.textColor = style.color
        super.textAlignment = style.textAlignment
        super.adjustsFontForContentSizeCategory = true
    }
}
