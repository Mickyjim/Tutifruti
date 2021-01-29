//
//  SettingsView.swift
//  Tutifruti
//
//  Created by Michael Favre on 16/01/2021.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "How much fruit nutrition should be included in our daily diet?", labelImage: "info.circle")) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 70)
                                .cornerRadius(9)
                            
                            Text("""
Research studies suggest that one may eat any servings of fruits daily. It is recommended to eat at least 2-3 servings of fresh fruits every day.

The term, "one fruit serving" is about 250 g of cleaned, "edible-portion" of the fruit, excluding discards like the peel, seeds, etc.

Include seasonal fruits in the daily diet. Varieties of fruits types (tropical, sub-arctic berries, tree fruits, etc.), color (blueberries, mangoes, pink guava, yellow-watermelon, black grapes, black sapodilla, etc.), and different flavored should be encouraged to get maximum health benefits. Yellow and orange color fruits are rich sources of &alfa; and ß carotenes, zeaxanthin, and cryptoxanthin, while blue, black colored like black or blueberries are an excellent source of polyphenolic anthocyanin antioxidants.
""")
                                .font(.footnote)
                        }
                    }
                }
                
            }//: VSTACK
            .navigationBarTitle(Text("Consumption"), displayMode: .large)
            .navigationBarItems(
                trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            )
            .padding()
        } //: SCROLL
    }//: NAVIGATION
    
    
    // MARK: - PREVIEW
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
                .preferredColorScheme(.dark)
        }
    }
}
