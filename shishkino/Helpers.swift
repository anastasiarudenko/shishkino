//
//  Helpers.swift
//  shishkino
//
//  Created by neonxxx on 23.05.2020.
//  Copyright © 2020 neonxxx. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

struct RectangleAnimation: ViewModifier {
    @Binding var show: Bool
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .border(Color(hex: 0x7d1c21), width: 1)
            .frame(width: 15, height: 15)
            .animation(Animation.easeInOut(duration: 0.6)
            .repeatForever(autoreverses: true))
            .onAppear() { self.show.toggle()}
    }
}

extension Image {
    func socailItem() -> some View {
        self
            .renderingMode(.template)
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(Color(hex: 0x7d1c21))
            .padding(10)
    }
    func menuItem() -> some View {
         self
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .cornerRadius(5)
            .padding(10)
    }
}

extension Text {
    func captionItem() -> some View {
        self
            .foregroundColor(.gray)
            .font(.caption)
            .multilineTextAlignment(.leading)
            .padding(10)
            .lineLimit(2)
    }
}
