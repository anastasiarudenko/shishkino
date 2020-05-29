//
//  MenuButton.swift
//  shishkino
//
//  Created by neonxxx on 23.05.2020.
//  Copyright © 2020 neonxxx. All rights reserved.
//

import SwiftUI

struct MenuButton : View {
    @Binding var show : Bool
    var body: some View {
        Button(action: { self.show.toggle() }) {
            Image(systemName: "circle.grid.2x2.fill")
                .imageScale(.large)
                .padding()
        }
    }
}
