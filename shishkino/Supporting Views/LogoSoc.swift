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
                .socailItem()
                .frame(width: 34)
            Image("inst_logo")
                .socailItem()
            Image("telegram_logo")
                .socailItem()
        }
    }
}

struct LogoSoc_Preview: PreviewProvider {
    static var previews: some View {
        LogoSoc()
    }
}

