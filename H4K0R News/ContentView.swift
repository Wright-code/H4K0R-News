//
//  ContentView.swift
//  H4K0R News
//
//  Created by Harry Wright on 28/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                      ZStack {
                          Circle()
                              .fill(Color.green)
                              .frame(width: 40, height: 40, alignment: .center)
                              .overlay(VStack {
                                  Image(systemName: "arrow.up")
                                  Text(verbatim: String(post.points))
                                    .fontWeight(.medium)
                              })
                      }
                          Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4K0R News")
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
