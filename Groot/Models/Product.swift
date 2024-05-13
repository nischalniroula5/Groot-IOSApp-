//
//  Product.swift
//  Groot
//
//  Created by Nischal Niroula on 1/5/2024.
//

import Foundation

struct Product: Identifiable, Codable {
    let id = UUID()
    let businessID: Int
    let name: String
    let subtitle: String
    let cultureID: CultureID
    //let cultureID: Int
    //let contactDetails: String
    let phoneNumber: String
    let email: String
    //let locationID: String
    let address: String
    let city: String
    let country: String
    let priceRange: String
    let status: String
    let addOn: Date
    // Assuming imageName, distance, hours, rating, price, category, and description were part of your original model, you can include them if they are still relevant.
    let imageName: String
    let distance: Double
    let hours: String
    let rating: Int
    let price: String
    let category: Category
    let description: String
}

enum CultureID: String, Codable, CaseIterable {
    case nepal = "Nepal"
    case india = "India"
    case vietnam = "Vietnam"
    case pakistan = "Pakistan"
    case china = "China"
    case ghana = "Ghana"
    case indonesia = "Indonesia"
    case mexico = "Mexico"
    case thailand = "Thailand"
    case zimbabwe = "Zimbabwe"
    case srilanka = "Sri Lanka"
}


enum Category: String, CaseIterable, Codable {
    case all = "All"
    case restaurants = "Restaurants"
    case grocery = "Grocery"
    case clothing = "Clothing"
    case travel = "Travel"
}

//Sample Data
let allProducts: [Product] = [
    Product(
        businessID: 106,
        name: "Gurkhas Restaurant",
        subtitle: "Traditional Nepali cuisine with a modern twist.",
        cultureID: .nepal,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$",
        status: "Open",
        addOn: Date(),
        imageName: "gurkhas",
        distance: 3.5,
        hours: "11:00 am to 12:00 am",
        rating: 4,
        price: "$",
        category: .restaurants,
        description: "Traditional Nepali cuisine with a modern twist. Enjoy a delightful dining experience in a cozy atmosphere."
        
    ),
    Product(
        businessID: 106,
        name: "Momo Central",
        subtitle: "Specializing in authentic Nepalese dumplings.",
        cultureID: .india,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "momoCentral",
        distance: 4.7,
        hours: "10:00 am to 11:00 pm",
        rating: 5,
        price: "$$",
        category: .restaurants,
        description: "Specializing in authentic Nepalese dumplings, offering a variety of fillings and flavors."
    ),
    Product(
        businessID: 106,
        name: "Nepalese Grocery",
        subtitle: "Your one-stop shop for fresh, organic produce and Nepalese spices.",
        cultureID: .nepal,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$",
        status: "Open",
        addOn: Date(),
        imageName: "nepaleseGrocery",
        distance: 2.0,
        hours: "9:00 am to 9:00 pm",
        rating: 4,
        price: "$",
        category: .grocery,
        description: "Your one-stop shop for fresh, organic produce and Nepalese spices."
    ),
    Product(
        businessID: 106,
        name: "Green Grocers",
        subtitle: "Local market featuring a vast range of green, sustainable produce directly from local farmers.",
        cultureID: .india,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$",
        status: "Open",
        addOn: Date(),
        imageName: "greenGrocers",
        distance: 1.5,
        hours: "8:00 am to 8:00 pm",
        rating: 5,
        price: "$",
        category: .grocery,
        description: "Local market featuring a vast range of green, sustainable produce directly from local farmers."
    ),
    Product(
        businessID: 106,
        name: "Organic Foods",
        subtitle: "Providing a healthy selection of organic foods.",
        cultureID: .nepal,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "organicFoods",
        distance: 3.8,
        hours: "7:30 am to 9:00 pm",
        rating: 4,
        price: "$$",
        category: .grocery,
        description: "Providing a healthy selection of organic foods that support your wellness and taste buds."
    ),
    Product(
        businessID: 106,
        name: "Daily Needs",
        subtitle: "Essential grocery store with a focus on high quality, everyday necessities at affordable prices.",
        cultureID: .vietnam,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$",
        status: "Open",
        addOn: Date(),
        imageName: "dailyNeeds",
        distance: 4.0,
        hours: "8:00 am to 10:00 pm",
        rating: 3,
        price: "$",
        category: .grocery,
        description: "Essential grocery store with a focus on high quality, everyday necessities at affordable prices."
    ),
    Product(
        businessID: 106,
        name: "Nepa Fashion House",
        subtitle: "Chic and contemporary clothing store.",
        cultureID: .nepal,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "nepaFashion",
        distance: 5.1,
        hours: "10:00 am to 9:00 pm",
        rating: 3,
        price: "$$",
        category: .clothing,
        description: "Chic and contemporary clothing store offering the latest in high fashion and street wear."
    ),
    Product(
        businessID: 106,
        name: "Urban Trends",
        subtitle: "Fashion boutique known for its urban and modern apparel.",
        cultureID: .india,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "urbanTrends",
        distance: 3.3,
        hours: "9:00 am to 8:00 pm",
        rating: 5,
        price: "$$",
        category: .clothing,
        description: "Fashion boutique known for its urban and modern apparel inspired by global trends."
    ),
    Product(
        businessID: 106,
        name: "Vintage Wear",
        subtitle: "Exclusive vintage clothing shop.",
        cultureID: .vietnam,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "vintageWear",
        distance: 6.5,
        hours: "11:00 am to 7:00 pm",
        rating: 4,
        price: "$$$",
        category: .clothing,
        description: "Exclusive vintage clothing shop offering unique, hand-picked garments for every occasion."
    ),
    Product(
        businessID: 106,
        name: "My Dream Travels",
        subtitle: "Luxury Bespoke Travel",
        cultureID: .india,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "myDreams",
        distance: 8.0,
        hours: "8:00 am to 10:00 pm",
        rating: 5,
        price: "$$$",
        category: .travel,
        description: "Bespoke travel experiences that bring your dream vacations to life with luxurious and adventurous packages."
    ),
    Product(
        businessID: 106,
        name: "Adventure Awaits",
        subtitle: "Thrilling adventure tours designed for those who seek excitement and challenge.",
        cultureID: .vietnam,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "adventureAwaits",
        distance: 12.0,
        hours: "6:00 am to 10:00 pm",
        rating: 5,
        price: "$$$",
        category: .travel,
        description: "Thrilling adventure tours designed for those who seek excitement and challenge in exotic locations."
    ),
    Product(
        businessID: 106,
        name: "Global Journeys",
        subtitle: "World-class travel agency offering global tours with a focus on cultural immersion and luxury.",
        cultureID: .vietnam,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "globalJourneys",
        distance: 15.3,
        hours: "24/7",
        rating: 4,
        price: "$$$",
        category: .travel,
        description: "World-class travel agency offering global tours with a focus on cultural immersion and luxury."
    )
]


