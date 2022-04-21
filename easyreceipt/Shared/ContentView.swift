//
//  ContentView.swift
//  Shared
//
//  Created by jeremiah choi, ap on 4/19/22.
//

import SwiftUI

let apiUrl = "https://jsonplaceholder.typicode.com/todos"

struct ReceiptData: Identifiable, Decodable {
    let id = UUID()
    let name: String
}

class ReceiptDataViewModel: ObservableObject {

    @Published var messages = "Messages inside observable object"

    @Published var courses: [Course] = {
        .init(name: "Receipt 1"),
        .init(name: "Receipt 2"),
        .init(name: "Receipt 3")
    }

    func changeMessage() {
        self.messages = "blah blah blah"
    }

    func fetchCourses() {
        guard let url = URL(string: apiUrl) else {return}
        URLSession.shared.dataTask(with:url) { (data, resp, err) in
        
        self.courses = try! JSONDecoder().decode([Course].self, from: data!)}.resume()
    }

}
struct ContentView: View {
    var body: some View {
        NavigationView {
        ScrollView {
            Text("Test hello world!")
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
