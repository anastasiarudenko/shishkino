//
//  Home.swift
//  shishkino
//
//  Created by neonxxx on 04.11.2019.
//  Copyright © 2019 neonxxx. All rights reserved.
//

import SwiftUI

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

struct SearchButton : View {
    @Binding var show : Bool
    var body: some View {
        Button(action: { self.show.toggle() }) {
            Image(systemName: "magnifyingglass.circle.fill")
                .imageScale(.large)
                .padding()
        }
    }
}

struct MenuRow : View {
    var text = "й"
    var action = "й"
    var body: some View {
        return Button (action: {}) {
                Text(text)
                    .font(.headline)
                    .foregroundColor(Color.white)
                if text == "О кино"
                {
                    Image(systemName: "chevron.right")
                        .imageScale(.large)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 0, leading: 150, bottom: 0, trailing: 0))
                }
            }
    }
}

struct MenuView : View {
    var menu = menuData
    @Binding var show : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            ForEach(menu) { item in
                MenuRow(text: item.title, action: item.action)
            }
            
            HStack{
                Text("Макс Шишкин в социальных сетях:")
                    .font(.headline)
                    .foregroundColor(Color(red: 0.486, green: 0.114, blue: 0.125))
                    .lineLimit(2)
            }
            .padding(.top, 90)
            
            LogoSoc()
            
            Spacer()
            
        }
        .padding(.top, 15)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.039, opacity: 0.942))
        .cornerRadius(30)
        .padding(.trailing, 60)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
        .animation(.default)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
    }
}


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
                Color(hue                             : 0.0, saturation                             : 0.0, brightness                             : 0.037).edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators : false) {
                    VStack {
                        ForCategory(categoryName      : "Свежее", items      : self.categories["Свежее"]!)
                        ForCategory(categoryName      : "Размышления", items      : self.categories["Размышления"]!)
                        ForCategory(categoryName      : "Горячие списки", items      : self.categories["Горячие списки"]!)
                        ForCategory(categoryName      : "Подкасты", items      : self.categories["Подкасты"]!)
                        .listRowInsets(EdgeInsets())
                    }
                    .blur(radius                      : show ? 50                       : 0)
                    .animation(.default)
                }
                
                MenuView(show : $show)
                    
                .navigationBarItems(
                    leading                           : MenuButton(show                           : $show)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    .animation(.spring()),
                    trailing                          : SearchButton(show                          : $show)
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
