//
//  CategoryHome.swift
//  shishkino
//
//  Created by neonxxx on 23.05.2020.
//  Copyright © 2020 neonxxx. All rights reserved.
//
import SwiftUI

struct CategoryHome: View {
    
    @State var show = false

    var categories: [String: [Kino]] {
        Dictionary(
            grouping: kinoData,
            by: { $0.category.rawValue }
        )
    }

    var body: some View {
        NavigationView  {
            ZStack {
                Color(hue: 0.0, saturation: 0.0, brightness: 0.037).edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators : false) {
                    VStack {
                        ForCategory(categoryName      : "Свежее",         items      : self.categories["Свежее"]!)
                        ForCategory(categoryName      : "Размышления",    items      : self.categories["Размышления"]!)
                        ForCategory(categoryName      : "Горячие списки", items      : self.categories["Горячие списки"]!)
                        ForCategory(categoryName      : "Подкасты",       items      : self.categories["Подкасты"]!)
                        .listRowInsets(EdgeInsets())
                    }
                    .blur(radius: show ? 50 : 0)
                    .animation(.default)
                }
                
                MenuView(show : $show)
                    
                .navigationBarItems(
                    leading: MenuButton(show: $show)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    .animation(.spring()),
                    trailing: SearchButton(show: $show)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                )
            }
        }
    }
}


struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
