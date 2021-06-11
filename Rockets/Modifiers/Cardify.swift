//
//  Cardify.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 8
    }
    
    let isShadowEnabled: Bool
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if isShadowEnabled {
            content.background(
                RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2),
                            radius: Constants.cornerRadius, x: 0, y: 0)
            )
        } else {
            content.background(
                RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                    .fill(Color.white)
            )
        }
    }
    
}

extension View {
    
    func cardify(isShadowEnabled: Bool = false) -> some View {
        modifier(Cardify(isShadowEnabled: isShadowEnabled))
    }
    
}
