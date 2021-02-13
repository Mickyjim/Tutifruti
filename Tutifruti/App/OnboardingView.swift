//
//  OnboardingView.swift
//  Tutifruti
//
//  Created by Michael Favre on 16/01/2021.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - PROPERTIES
    var fruits: [Fruit] = fruitData
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
            }
        }
        
        //: Tab implementation
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitData)
    }
}
