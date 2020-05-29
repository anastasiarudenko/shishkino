//
//  SearchButton.swift
//  shishkino
//
//  Created by neonxxx on 23.05.2020.
//  Copyright © 2020 neonxxx. All rights reserved.
//

import SwiftUI

struct SearchButton : View {
    @Binding var show : Bool
    var body: some View {
        Button(action: { getCateg() }) {
            Image(systemName: "magnifyingglass.circle.fill")
                .imageScale(.large)
                .padding()
        }
    }
}
