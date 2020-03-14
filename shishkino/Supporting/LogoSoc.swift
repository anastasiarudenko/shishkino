//
//  LogoSoc.swift
//  shishkino
//
//  Created by neonxxx on 04.11.2019.
//  Copyright © 2019 neonxxx. All rights reserved.
//

import SwiftUI

struct LogoSoc: View {
    var body: some View {
        HStack {
            Image("vimeo_logo")
                .renderingMode(.template)
                .resizable()
                .frame(width: 34, height: 30)
                .foregroundColor(Color(red: 0.486, green: 0.114, blue: 0.125))
                .padding(10)
            Image("inst_logo")
                .renderingMode(.template)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(red: 0.486, green: 0.114, blue: 0.125))
                .padding(10)
            Image("telegram_logo")
                .renderingMode(.template)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(red: 0.486, green: 0.114, blue: 0.125))
                .padding(10)
        }
    }
}

struct LogoSoc_Preview: PreviewProvider {
    static var previews: some View {
        LogoSoc()
    }
}

