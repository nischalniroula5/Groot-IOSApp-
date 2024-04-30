import SwiftUI

struct ProductDetailView: View {
    var product: Product
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Product image
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .clipped()

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
                                .foregroundColor(.yellow)
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

                Spacer()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(name: "Sample Restaurant", imageName: "sampleRestaurant", distance: 2.5, hours: "10:00 am to 9:00 pm", rating: 5, price: "$$$", category: .restaurants, description: "A sample restaurant offering an exquisite dining experience with a focus on Italian cuisine."))
    }
}
