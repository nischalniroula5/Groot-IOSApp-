import SwiftUI

struct ProductDetailView: View {
    
    @ObservedObject var favoritesManager = FavoritesManager.shared
    
    var product: Product
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack {
                    GeometryReader { geometry in
                        Image(product.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                    }
                    .frame(height: 300)
                }
                // Product name and rating
                HStack {
                    Text(product.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(darkBlue)
                    
                    Spacer()
                    
                    HStack {
                        ForEach(0..<product.rating, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(darkBlue)
                        }
                    }
                }
                .padding(.horizontal)
                
                // Price and distance
                HStack {
                    Text(product.price)
                        .font(.headline)
                        .foregroundColor(darkBlue)
                    Spacer()
                    Text("\(String(format: "%.2f", product.distance)) km away")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Operating hours
                Text("Operating Hours: \(product.hours)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                // Description
                Text(product.description)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Button(action: {
                    if self.favoritesManager.isFavorite(product: self.product) {
                        self.favoritesManager.removeFavorite(product: self.product)
                    } else {
                        self.favoritesManager.addFavorite(product: self.product)
                    }
                }) {
                    Text(self.favoritesManager.isFavorite(product: self.product) ? "Remove from Favourites" : "Save To Favourites")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(darkBlue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                
                // Buttons for actions
                HStack {
                    Button(action: {
                        // Action for contacting the business
                        guard let phoneURL = URL(string: "tel://\(product.phoneNumber)") else { return }
                        UIApplication.shared.open(phoneURL)
                    }) {
                        Text("Contact Business")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(darkBlue)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Action for opening in map
                        let mapURLString = "http://maps.apple.com/?address=\(product.address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
                        guard let mapURL = URL(string: mapURLString) else { return }
                        UIApplication.shared.open(mapURL)
                    }) {
                        Text("Open in Map")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(darkBlue)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Spacer()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(
            businessID: 106,
            name: "Sample Restaurant",
            subtitle: "A sample restaurant offering an exquisite dining experience.",
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
