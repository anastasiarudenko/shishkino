//
//  WelcomeImage.swift
//  shishkino
//
//  Created by neonxxx on 04.11.2019.
//  Copyright © 2019 neonxxx. All rights reserved.
//

import SwiftUI

struct WelcomeImage: View {
    var body: some View {
        Image("welcome")
            .resizable()
            .frame(width: 350, height: 245)
    }
}

struct WelcomeImage_Preview: PreviewProvider {
    static var previews: some View {
        WelcomeImage()
    }
}
