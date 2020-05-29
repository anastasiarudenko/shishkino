//
//  GetPosts.swift
//  shishkino
//
//  Created by neonxxx on 25.03.2020.
//  Copyright © 2020 neonxxx. All rights reserved.
//

import Foundation

func getCateg() {
    guard let url = URL(string: "https://demo.wp-api.org/wp-json/wp/v2/posts") else { return  }
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
        if let response = response {
            print(response)
        }
        
        guard let data = data else { return }
                            
        do {
//            let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
//            print(json)
            
            let response = try JSONDecoder().decode([PostElement].self, from: data)
            print(response)
        } catch {
            print("error get categories")
        }
    }.resume()
}
