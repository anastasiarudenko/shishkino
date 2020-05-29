//
//  Posts.swift
//  shishkino
//
//  Created by neonxxx on 23.05.2020.
//  Copyright © 2020 neonxxx. All rights reserved.
//

import Foundation

// MARK: - PostElement
struct PostElement: Codable {
    let content, excerpt: Contentt

    enum CodingKeys: String, CodingKey {
        case content, excerpt
    }
}


// MARK: - Content
struct Contentt: Codable {
    let rendered: String
    let protected: Bool
}
