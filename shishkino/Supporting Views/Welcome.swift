//
//  Welcome.swift
//  shishkino
//
//  Created by neonxxx on 04.11.2019.
//  Copyright © 2019 neonxxx. All rights reserved.
//

import SwiftUI

struct Welcome: View {
    
    @State private var topLeftOffset = false
    @State private var topRightOffset = false
    @State private var bottomLeftOffset = false
    @State private var bottomRightOffset = false
    @State private var rotateSquares = false
    
    var body: some View {
        ZStack{
            
            Color(hue: 0.0, saturation: 0.0, brightness: 0.037).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                WelcomeImage()
                
                HStack{
                    Text("ШишКИН")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.486, green: 0.114, blue: 0.125))
                        
                    LogoImage()
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(hex: 0x7d1c21))
                        .modifier(RectangleAnimation(show: self.$topLeftOffset))
                        .offset(x: topLeftOffset ? -15 : 0, y: topLeftOffset ? -15 : 0)
                    Rectangle()
                        .modifier(RectangleAnimation(show: self.$topRightOffset))
                        .offset(x: topRightOffset ? 15 : 0, y: topRightOffset ? -15 : 0)
                    Rectangle()
                        .modifier(RectangleAnimation(show: self.$bottomLeftOffset))
                        .offset(x: bottomLeftOffset ? -15 : 0, y: bottomLeftOffset ? 15 : 0)
                    Rectangle()
                        .modifier(RectangleAnimation(show: self.$bottomRightOffset))
                        .offset(x: bottomRightOffset ? 15 : 0, y: bottomRightOffset ? 15 : 0)
                }
                .rotationEffect(.radians(rotateSquares ? .pi : -.pi/8))
                .animation(Animation.easeInOut(duration: 1.3)
                .repeatForever(autoreverses: true))
                .onAppear() {self.rotateSquares.toggle() }
                .padding(.bottom, 30)
                        
                WelcomeImage()
                
            }
        }
    }
}

struct Welcome_Preview: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}

