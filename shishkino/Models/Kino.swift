//
//  Kino.swift
//  shishkino
//
//  Created by neonxxx on 04.11.2019.
//  Copyright © 2019 neonxxx. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Kino: Hashable, Codable, Identifiable {
    var name: String
    var id: Int
    fileprivate var imageName: String
    var category: Category
    enum Category: String, CaseIterable, Codable, Hashable {
        case new_re = "Свежее"
        case thinking = "Размышления"
        case hot_lists = "Горячие списки"
        case podcasts = "Подкасты"
    }
}

extension Kino {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
