//
//  HomeScreenView.swift
//  Groot
//
//  Created by Nischal Niroula on 23/4/2024.
//

import SwiftUI

struct HomeScreenView: View {
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    
    //Sample Data
    var userName = "Nischal Niroula"
    
    //Categories for the horizontal menu
    @State private var SelectedCategory: String = "All"
    let categories = ["All", "Restaurants", "Grocery", "Clothing"]
    
    @State private var showMenu = false
    @State private var showCountryChooser = false
    @State private var searchText = ""
    
    @State private var selectedCategory: Category = .all
    
    // Sample data
    let allProducts: [Product] = [
        Product(name: "Gurkhas Restaurant", imageName: "gurkhas", distance: 3.5, hours: "11:00 am to 12:00 am", rating: 4, price: "$", category: .restaurants, description: "Traditional Nepali cuisine with a modern twist. Enjoy a delightful dining experience in a cozy atmosphere."),
        Product(name: "Momo Central", imageName: "momoCentral", distance: 4.7, hours: "10:00 am to 11:00 pm", rating: 5, price: "$$", category: .restaurants, description: "Specializing in authentic Nepalese dumplings, offering a variety of fillings and flavors."),
        
        Product(name: "Nepalese Grocery", imageName: "nepaleseGrocery", distance: 2.0, hours: "9:00 am to 9:00 pm", rating: 4, price: "$", category: .grocery, description: "Your one-stop shop for fresh, organic produce and Nepalese spices."),
        Product(name: "Green Grocers", imageName: "greenGrocers", distance: 1.5, hours: "8:00 am to 8:00 pm", rating: 5, price: "$", category: .grocery, description: "Local market featuring a vast range of green, sustainable produce directly from local farmers."),
        Product(name: "Organic Foods", imageName: "organicFoods", distance: 3.8, hours: "7:30 am to 9:00 pm", rating: 4, price: "$$", category: .grocery, description: "Providing a healthy selection of organic foods that support your wellness and taste buds."),
        Product(name: "Daily Needs", imageName: "dailyNeeds", distance: 4.0, hours: "8:00 am to 10:00 pm", rating: 3, price: "$", category: .grocery, description: "Essential grocery store with a focus on high quality, everyday necessities at affordable prices."),
        
        Product(name: "Nepa Fashion House", imageName: "nepaFashion", distance: 5.1, hours: "10:00 am to 9:00 pm", rating: 3, price: "$$", category: .clothing, description: "Chic and contemporary clothing store offering the latest in high fashion and street wear."),
        Product(name: "Urban Trends", imageName: "urbanTrends", distance: 3.3, hours: "9:00 am to 8:00 pm", rating: 5, price: "$$", category: .clothing, description: "Fashion boutique known for its urban and modern apparel inspired by global trends."),
        Product(name: "Vintage Wear", imageName: "vintageWear", distance: 6.5, hours: "11:00 am to 7:00 pm", rating: 4, price: "$$$", category: .clothing, description: "Exclusive vintage clothing shop offering unique, hand-picked garments for every occasion."),
        
        Product(name: "My Dream Travels", imageName: "myDreams", distance: 8.0, hours: "8:00 am to 10:00 pm", rating: 5, price: "$$$", category: .travel, description: "Bespoke travel experiences that bring your dream vacations to life with luxurious and adventurous packages."),
        Product(name: "Adventure Awaits", imageName: "adventureAwaits", distance: 12.0, hours: "6:00 am to 10:00 pm", rating: 5, price: "$$$", category: .travel, description: "Thrilling adventure tours designed for those who seek excitement and challenge in exotic locations."),
        Product(name: "Global Journeys", imageName: "globalJourneys", distance: 15.3, hours: "24/7", rating: 4, price: "$$$", category: .travel, description: "World-class travel agency offering global tours with a focus on cultural immersion and luxury."),
    ]
    
    
    // Grid of products filtered by selected category
    var filteredProducts: [Product] {
        let categoryFilteredProducts = selectedCategory == .all ? allProducts : allProducts.filter { $0.category == selectedCategory }
        return sortProducts(products: categoryFilteredProducts)
    }
    
    
    
    
    // Defining  filter types
    enum FilterType: String, CaseIterable {
        case nearest = "Nearest"
        case mostRated = "Most Rated"
        case openNow = "Open Now"
    }
    
    // State for selected menu and filter
    @State private var selectedMenu: String = "All"
    @State private var selectedFilter: FilterType = .nearest
    
    
    var body: some View {
        NavigationView {
            VStack {
                CustomSearchBar()
                    .padding(.horizontal,8)
                
                // Category selection
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Category.allCases, id: \.self) { category in
                            Button(action: {
                                self.selectedCategory = category
                            }) {
                                Text(category.rawValue)
                                    .padding()
                                    .foregroundColor(selectedCategory == category ? darkBlue : Color.gray)
                            }
                        }
                    }
                }
                
                // Filter options
                HStack {
                    Spacer()
                    Picker(selection: $selectedFilter, label: Text("Filter").foregroundColor(.gray)) {
                        ForEach(FilterType.allCases, id: \.self) { filter in
                            Text(filter.rawValue)
                                .tag(filter)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                    
                    
                }
                .padding(.leading)
                
                // Product grid view
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(filteredProducts) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductCard(product: product)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationBarItems(
                leading: HamburgerMenuButton(showMenu: $showMenu),
                trailing: CountryChooserButton(showCountryChooser: $showCountryChooser)
            )
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $showCountryChooser) {
            // Your Country Chooser View
            Text("Country Chooser Placeholder")
        }
        // Add your side menu view here
        .overlay(
            SideMenuView(showMenu: $showMenu),
            alignment: .leading
        )
    }
}

struct HamburgerMenuButton: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                showMenu.toggle()
            }
        }) {
            Image("hamburgerIcon")
                .imageScale(.large)
        }
    }
}

struct CountryChooserButton: View {
    @Binding var showCountryChooser: Bool
    
    var body: some View {
        Button(action: {
            showCountryChooser.toggle()
        }) {
            Image("globeIcon")
                .imageScale(.large)
        }
    }
}

struct CustomSearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
            //.shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("What are you looking for...", text: $searchText)
                    .foregroundColor(.black)
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.leading, 12)
        }
        .frame(height: 40)
        .padding(.horizontal, 10)
    }
}

struct SideMenuView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack {
            if showMenu {
                VStack {
                    // Your menu content here
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    // Add more menu items...
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.red)
                .transition(.move(edge: .leading))
            }
        }
        .background(Color.blue)
    }
}

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let distance: Double
    let hours: String
    let rating: Int
    let price: String
    let category: Category
    let description: String
}

enum Category: String, CaseIterable {
    case all = "All"
    case restaurants = "Restaurants"
    case grocery = "Grocery"
    case clothing = "Clothing"
    case travel = "Travel"
}


struct ProductCard: View {
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: (UIScreen.main.bounds.width / 2) - 24, height: 130)
                .clipped()
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.headline)
                    .lineLimit(1)
                    .foregroundColor(darkBlue)
                Text("\(String(format: "%.2f", product.distance)) Kms away")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(product.hours)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    ForEach(0..<product.rating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(darkBlue)
                            .font(/*@START_MENU_TOKEN@*/.caption2/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                    Text(product.price)
                        .foregroundColor(darkBlue)
                }
            }
            .padding([.leading, .bottom, .trailing], 8)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
        .frame(width: (UIScreen.main.bounds.width / 2) - 24)
    }
}

extension HomeScreenView {
    private func sortProducts(products: [Product]) -> [Product] {
        switch selectedFilter {
        case .nearest:
            
            return products.sorted { $0.distance < $1.distance }
        case .mostRated:
            return products.sorted { $0.rating > $1.rating }
        case .openNow:
            // Implement your logic to determine if a place is currently open
            // For demonstration, assuming 'hours' contains a string "Open Now" if it's open
            return products.filter { $0.hours.contains("Open Now") }
        }
    }
}





struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
