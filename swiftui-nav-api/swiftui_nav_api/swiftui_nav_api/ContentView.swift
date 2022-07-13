//
//  ContentView.swift
//  swiftui_nav_api
//
//  Created by Frankie Barrios on 7/7/22.
//

import SwiftUI

struct Gadget: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

struct ContentView: View {
    
    private var gadgets = [Gadget(name: "iPhone 7", image: "iPhone 7"), Gadget(name: "iPhone 8", image: "iPhone 8"), Gadget(name: "iPhone 8 Plus", image: "iPhone 8 Plus"), Gadget(name: "iPhone X", image: "iPhone X")]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                List(gadgets) { gadget in
                    NavigationLink(gadget.name, value: gadget)
                }.navigationTitle("Gadgets Gallery")
                    .navigationDestination(for: Gadget.self) { gadget in
                        VStack {
                            Image(gadget.image)
                                .resizable()
                                .scaledToFit()
                            Text(gadget.name)
                        }
                        
                    }
            }
        } else {
            // Fallback on earlier versions
        }    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
