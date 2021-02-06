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
    
    var fruit: [Fruit] = fruitData
    var driedFruit: [DriedFruit] = driedFruitData
    
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
            }
            
//            NavigationView {
//                List {
//                    Section(header: Text("Dried fruits").padding(.leading, -10)) {
//                        ForEach(driedFruit) { item in
//                            NavigationLink(destination: FruitDetailView(driedFruit: item)) {
//                                FruitRowView(driedFruit: item)
//                                    .padding(.vertical, 4)
//                            }
//                        }
//                    }
//                }
                .navigationTitle("Category")
                //            .navigationBarItems(trailing: Button(action: {}) { Text("Fetch Creatures") })
                .navigationBarItems(trailing:
                                        Button(action: {
                                            isShowingSettings = true
                                        }) {
                                            Image(systemName: "slider.horizontal.3")
                                        } //: BUTTON
                                        .sheet(isPresented: $isShowingSettings, content: {
                                            SettingsView()
                                        })
                )
            } //: NAVIGATION
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    // MARK: - PREVIEW
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(fruit: fruitData)
        }
    }
//}
