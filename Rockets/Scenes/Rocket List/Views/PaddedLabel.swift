//
//  PaddedLabel.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import UIKit

class PaddedLabel: UILabel {
    
    public var insets: UIEdgeInsets = .zero {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize
        return CGSize(width: contentSize.width + insets.left + insets.right,
                      height: contentSize.height + insets.top + insets.bottom)
    }
    
}
