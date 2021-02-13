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
                            SettingsLabelView(labelText: "Medical Disclaimer", labelImage: "info.circle")) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 70)
                                .cornerRadius(9)
                            
                            Text("""
The information and reference guides in this app are intended solely for the general information for the reader. The contents of this app are not intended to offer personal medical advice, diagnose health problems or for treatment purposes. It is not a substitute for medical care provided by a licensed and qualified health professional. Please consult your health care provider for any advice on medications.

The information in the site does not mention brand names, nor does it endorse any particular products.
""")
                                .font(.footnote)
                        }
                    }
                }
                
            }//: VSTACK
            .navigationBarTitle(Text("Disclaimer"), displayMode: .large)
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
