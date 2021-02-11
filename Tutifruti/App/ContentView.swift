//
//  ContentView.swift
//  Tutifruti
//
//  Created by Michael Favre on 16/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    @State private var searchText = ""
    
    var fruit: [Fruit] = fruitData
    var driedFruit: [Fruit] = driedFruitData
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fruits").padding(.leading, -10)) {
                    ForEach(fruit) { item in
                        NavigationLink(destination: FruitDetailView(fruit: item)) {
                            FruitRowView(fruit: item)
                                .padding(.vertical, 4)
                        }
                    }
                }
                
                
                
                Section(header: Text("Dried fruits").padding(.leading, -10)) {
                    ForEach(driedFruit) { item in
                        NavigationLink(destination: FruitDetailView(fruit: item)) {
                            FruitRowView(fruit: item)
                                .padding(.vertical, 4)
                        }
                    }
                }
                
//                SearchBar(text: $searchText)
//                    .padding(.top, -30)
//                
//                List(fruit.filter({ searchText.isEmpty ? true : $0.fruitData.contains(searchText) })) { item in
//                    Text(item.fruitData)
                
            }
            .navigationTitle("Category")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruit: fruitData)
    }
}
