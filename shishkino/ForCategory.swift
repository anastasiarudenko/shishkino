//
//  ForCategory.swift
//  shishkino
//
//  Created by neonxxx on 04.11.2019.
//  Copyright © 2019 neonxxx. All rights reserved.
//

import SwiftUI

struct CategoryItem0: View {
    var kino: Kino
    var body: some View {
        VStack(alignment: .leading) {
            kino.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 100)
                .cornerRadius(5)
            Text(kino.name)
                .foregroundColor(.gray)
                .font(.caption)
                .multilineTextAlignment(.leading)
                .padding()
                .frame(width: 180)
                .lineLimit(2)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem1: View {
    var kino: Kino
    var body: some View {
        VStack(alignment: .leading) {
            kino.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 300)
                .cornerRadius(5)
            Text(kino.name)
                .foregroundColor(.gray)
                .font(.caption)
                .padding()
                .frame(width: 200)
                .lineLimit(2)
        }
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: Color(hue: 0.958, saturation: 0.733, brightness: 0.112, opacity: 0.641), radius: 20, x: 0, y: 14)
        .padding(.leading, 15)
    }
}

struct CategoryItem2: View {
    var kino: Kino
    var body: some View {
        VStack(alignment: .leading) {
            kino.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(5)
        }
        .padding(.leading, 15)
    }
}

struct ForCategory: View {
    var categoryName: String
    var items: [Kino]
    
    var body: some View {
        ZStack {
            Color(hue: 0.0, saturation: 0.0, brightness: 0.037).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text(self.categoryName)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(self.items) { kino in
                        
                            if self.categoryName == "Свежее" {
                                GeometryReader { geometry in
                                    Button(action: {}) {
                                        CategoryItem1(kino: kino)
                                            .rotation3DEffect(Angle(degrees: Double((geometry.frame(in: .global).minX - 30) / -30)), axis: (x: 0, y: 10, z: 10))
                                    }
                                }
                                .frame(width: 240, height: 400)
                            }
                            
                            if self.categoryName == "Размышления" {
                                CategoryItem0(kino: kino)
                                    .frame(height: 200)
                            }
                        
                            if self.categoryName == "Горячие списки" {
                                CategoryItem0(kino: kino)
                                    .frame(height: 200)
                            }
                            
                            if self.categoryName == "Подкасты" {
                                CategoryItem2(kino: kino)
                                    .frame(height: 150)
                            }
                        }
                    }
                    .padding(.vertical, 25)
                }
            }
        }
    }
}

struct ForCategory_Previews: PreviewProvider {
    static var previews: some View {
        ForCategory(
            categoryName: kinoData[0].category.rawValue,
            items: Array(kinoData.prefix(4))
        )
    }
}
