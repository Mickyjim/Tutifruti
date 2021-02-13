//
//  FruitDetailView.swift
//  Tutifruti
//
//  Created by Michael Favre on 16/01/2021.
//

import SwiftUI

struct FruitDetailView: View {
    
    // MARK: - PROPERTIES
    var fruit: Fruit
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    
                    // Item image header
                    FruitHeaderView(fruit: fruit)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Item title
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // Item headline
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        
                        // Item nutrients
                        FruitNutrientsView(fruit: fruit)
                        
                        // Item subheadline
                        Text("Learn more about \(fruit.title)" .uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // Item description
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        // Link to source
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                    }
                    
                    //: VSTACK
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }
                
                //: VSTACK
                .navigationBarTitle(fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
            }
            
            //: Scroll
            .edgesIgnoringSafeArea(.top)
        }
        
        //: Navigation
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitData[0])
    }
}

