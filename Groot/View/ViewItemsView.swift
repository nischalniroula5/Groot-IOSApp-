//
//  ViewItemsView.swift
//  Groot
//
//  Created by Nischal Niroula on 21/5/2024.
//
import SwiftUI
var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
struct Item: Identifiable {
    var id = UUID()
    var name: String
    var price: String
    var imageName: String
}

struct ViewItemsView: View {
    var product: Product
    var items: [Item] = [
        Item(name: "Rice Pudding", price: "$20", imageName: "rice_pudding"),
        Item(name: "Chicken Momo", price: "$17", imageName: "momo")
    ]
    
    var body: some View {
        VStack {
    
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(items) { item in
                        VStack {
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 120)
                                .cornerRadius(7)
                            
                            HStack {
                                Text(item.name)
                                    .font(.headline)
                                .foregroundColor(Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0))
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text(item.price)
                                    .font(.subheadline)
                                .foregroundColor(.gray)
                                
                                Spacer()
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(7)
                        
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationTitle("Items")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ViewItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ViewItemsView(product: Product(
            businessID: 106,
            name: "Sample Restaurant",
            subtitle: "A sample restaurant offering an exquisite dining experience.",
            cultureID: .nepal,
            phoneNumber: "+61 451 667 910",
            email: "nischalniroula5@gmail.com",
            address: "100 Collins Street, Melbourne, 3000",
            city: "Melbourne",
            country: "Australia",
            priceRange: "$$$",
            status: "Open",
            addOn: Date(),
            imageName: "sampleRestaurant",
            distance: 2.5,
            hours: "10:00 am to 9:00 pm",
            rating: 5,
            price: "$$$",
            category: .restaurants,
            description: "A sample restaurant offering an exquisite dining experience with a focus on Italian cuisine."
        ))
    }
}
