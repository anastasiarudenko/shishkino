//
//  Kino.swift
//  shishkino
//
//  Created by neonxxx on 04.11.2019.
//  Copyright © 2019 neonxxx. All rights reserved.
//

import SwiftUI

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

struct Menu : Identifiable {
    var id = UUID()
    var title: String
    var action: String
}

let menuData = [
    Menu(title: "Ревью", action: ""),
    Menu(title: "О кино", action: ""),
    Menu(title: "Горячие списки", action: ""),
    Menu(title: "Frame Fapping", action: ""),
    Menu(title: "Около кино", action: ""),
    Menu(title: "Интервью", action: ""),
    Menu(title: "Movie Tribute's", action: "")]

let OKinoData = [
    Menu(title: "Как смотреть", action: ""),
    Menu(title: "Размышления", action: ""),
    Menu(title: "Кинолекции", action: ""),
    Menu(title: "Колхозный анализ", action: ""),
    Menu(title: "Подкасты", action: "")]
