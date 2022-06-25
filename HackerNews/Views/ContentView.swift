//
//  ContentView.swift
//  HackerNews
//
//  Created by Arshaan Sayed on 6/25/22.
//

import SwiftUI
import WebKit
let coloredNavAppearance = UINavigationBarAppearance()

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor(red: 0.83, green: 0.33, blue: 0.00, alpha: 1.00)
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
    }
    
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                        
                    }
                }
                
                
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




