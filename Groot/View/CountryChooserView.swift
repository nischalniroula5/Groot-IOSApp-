//
//  CountryChooserView.swift
//  Groot
//
//  Created by Nischal Niroula on 11/5/2024.
//

import SwiftUI

struct Country: Identifiable {
    var id: Int
    let name: String
    let flagImage: String
}

struct CountryChooserView: View {
    @Binding var selectedFlagImage: String  // Binding to update the parent view's flag
    @Binding var isPresented: Bool
    
    let countries = [
        Country(id: 1, name: "Nepal", flagImage: "nepal"),
        Country(id: 2, name: "India", flagImage: "india"),
        Country(id: 3, name: "Pakistan", flagImage: "pakistan"),
        Country(id: 4, name: "China", flagImage: "china"),
        Country(id: 5, name: "Ghana", flagImage: "ghana"),
        Country(id: 6, name: "Indonesia", flagImage: "indonesia"),
        Country(id: 7, name: "Mexico", flagImage: "mexico"),
        Country(id: 8, name: "Vietnam", flagImage: "vietnam"),
        Country(id: 9, name: "Thailand", flagImage: "thailand"),
        Country(id: 10, name: "Zimbabwe", flagImage: "zimbabwe"),
        Country(id: 11, name: "Sri Lanka", flagImage: "srilanka")
    ]

    var body: some View {
        NavigationView {
            List(countries) { country in
                Button(action: {
                    self.selectedFlagImage = country.flagImage
                    self.isPresented = false
                }) {
                    HStack {
                        Image(country.flagImage)  // Ensure these images are correctly named in your assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 25)
                            .padding(.trailing, 15)
                        
                        Text(country.name)
                            .font(.system(size: 18))
                            .foregroundColor(.primary)  // Using the primary color for better adaptability with light/dark mode
                    }
                }
                .buttonStyle(PlainButtonStyle())  // Applying plain button style to remove any default button styling
            }
            .navigationBarTitle("Select Country", displayMode: .inline)
            .listStyle(PlainListStyle())  // Applying plain list style for a cleaner look
        }
    }
}

