//
//  Menu.swift
//  shishkino
//
//  Created by neonxxx on 23.05.2020.
//  Copyright © 2020 neonxxx. All rights reserved.
//

import SwiftUI

struct MenuRow : View {
    var text = ""
    var body: some View {
        return Button (action: {}) {
                Text(text)
                    .font(.headline)
                    .foregroundColor(Color.white)
                if text == "О кино"
                {
                    Image(systemName: "chevron.right")
                        .imageScale(.large)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 0, leading: 150, bottom: 0, trailing: 0))
                }
            }
    }
}

struct MenuView : View {
    var menu = menuData
    @Binding var show : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            ForEach(menu) { item in
                MenuRow(text: item.title)
            }
            
            HStack{
                Text("Макс Шишкин в социальных сетях:")
                    .font(.headline)
                    .foregroundColor(Color(red: 0.486, green: 0.114, blue: 0.125))
                    .lineLimit(2)
            }
            .padding(.top, 90)
            
            Button(action: {}) {
                LogoSoc()
            }
            
            Spacer()
            
        }
        .padding(.top, 15)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.039, opacity: 0.942))
        .cornerRadius(30)
        .padding(.trailing, 60)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
        .animation(.default)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
    }
}


