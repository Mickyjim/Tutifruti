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
    
    // filtering variable for Fruits in SearchBar
    var filteredFruit: [Fruit] {
        guard !searchText.isEmpty else { return fruit }
        return fruit.filter {
            $0.title.contains(searchText)
        }
    }
    
    // filtering variable for DriedFruits in SearchBar
    var filteredDriedFruit: [Fruit] {
        guard !searchText.isEmpty else { return driedFruit }
        return driedFruit.filter {
            $0.title.contains(searchText)
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                // SearchBar placement
                SearchBar(text: $searchText)
                List {
                    // Fruit header implementation
                    Section(header: Text("Fruits").padding(.leading, -10)) {
                        ForEach(filteredFruit) { item in
                            NavigationLink(destination: FruitDetailView(fruit: item)) {
                                FruitRowView(fruit: item)
                                    .padding(.vertical, 4)
                            }
                        }
                    }
                    
                    // DriedFruit header implementation
                    Section(header: Text("Dried fruits").padding(.leading, -10)) {
                        ForEach(filteredDriedFruit) { item in
                            NavigationLink(destination: FruitDetailView(fruit: item)) {
                                FruitRowView(fruit: item)
                                    .padding(.vertical, 4)
                            }
                        }
                    }
                }
                
            }
            
            .navigationTitle("Category")
            
            //: Settings button
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
            )
            
            //: Navigation
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
