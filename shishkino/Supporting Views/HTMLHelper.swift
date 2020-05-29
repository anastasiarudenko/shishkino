//
//  HTMLHelper.swift
//  shishkino
//
//  Created by neonxxx on 25.03.2020.
//  Copyright © 2020 neonxxx. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var htmlString: String
    @Binding var baseURL: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if self.htmlString != context.coordinator.lastLoadedHTML {
            context.coordinator.lastLoadedHTML = self.htmlString
            uiView.loadHTMLString(self.htmlString, baseURL: self.baseURL)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: WebView
        var lastLoadedHTML = ""
        
        // Empty but useful for when you need a navigation or ui delegate

        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}

struct ContentView: View {
    @State var htmlString = ""
    
    var body: some View {
        VStack {
            WebView(htmlString: self.$htmlString, baseURL: .constant(nil))
            Button("Test") {
                self.htmlString = "<h1>OH HAI</h1><body>DERP DERP DERP</body>"
            }
        }
    }
}

struct HTMLHelper_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
