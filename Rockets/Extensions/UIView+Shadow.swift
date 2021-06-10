//
//  UIView+Shadow.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import UIKit

struct ShadowProperties {
    
    var radius: CGFloat = 10.0
    var offset: CGSize = .zero
    var color: UIColor = .black
    var opacity: Float = 0.25
    
    init() {}
    
    init(radius: CGFloat, offset: CGSize, color: UIColor, opacity: Float) {
        self.radius = radius
        self.offset = offset
        self.color = color
        self.opacity = opacity
    }
    
}

extension UIView {
    
    func setRounded() {
        let radius = min(layer.bounds.width, layer.bounds.height) / 2
        setCornerRadius(radius)
    }
    
    func setCornerRadius(_ cornerRadius: CGFloat = 8.0) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    func setDropShadow(_ properties: ShadowProperties = ShadowProperties()) {
        layer.shadowRadius = properties.radius
        layer.shadowOffset = properties.offset
        layer.shadowColor = properties.color.cgColor
        layer.shadowOpacity = properties.opacity
    }
    
}
