//
//  ContentView.swift
//  Shared
//
//  Created by jeremiah choi, ap on 4/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        ScrollView {
            Text("Test hello world")
        }.navigationBarTitle("Easy Receipt")
        .navigationBarItems(trailing: Button(action: {
             print("Fetching json data")
        }, label: {
           Text("Fetch")
        }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
