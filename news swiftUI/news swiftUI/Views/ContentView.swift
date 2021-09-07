//
//  ContentView.swift
//  news swiftUI
//
//  Created by 정환우 on 2021/08/19.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkmanager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkmanager.posts){ post in
                NavigationLink(
                    destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4XOR NEWS")
        }
        .onAppear{
            self.networkmanager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
