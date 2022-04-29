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

class ReceiptDataVM: ObservableObject {

    @Published var messages = "Messages inside observable object"

    // todo: right now ReceiptDataVM owns this list
    // it seems that this list is supposed to be
    // abstracted away in another structure
    // between the ReceiptData and ReceiptDataVM
    @Published var receipts: [ReceiptData] = [
        .init(name: "Receipt 1"),
        .init(name: "Receipt 2"),
        .init(name: "Receipt 3")
    ]

    func changeMessage() {
        self.messages = "blah blah blah"
    }

    //func fetchReceipts() {
    //    guard let url = URL(string: apiUrl) else {return}
    //    URLSession.shared.dataTask(with:url) { (data, resp, err) in
    //
    //    self.courses = try! JSONDecoder().decode([ReceiptData].self, from: data!)}.resume()
    //}

}
struct ContentView: View {
    var body: some View {
        NavigationView {
        ScrollView {
            Text("Test hello world!")
        }.navigationBarTitle("Easy Receipt")
        .navigationBarItems(trailing: Button(action: {
             // todo: this should be changed to calling a function
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
