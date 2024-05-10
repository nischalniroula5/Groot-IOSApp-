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
