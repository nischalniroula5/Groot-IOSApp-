//
//  NotificationsView.swift
//  Groot
//
//  Created by Nischal Niroula on 24/4/2024.
//

import SwiftUI

struct Notification: Identifiable {
   
    
    var id = UUID()
    var title: String
    var subtitle: String
    var receivedDate: Date = Date() // Automatically sets to the current date and time
}

struct NotificationsView: View {
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    
    let notifications: [Notification] = [
        Notification(title: "New restaurant nearby! Just 3 km away!", subtitle: "Check it out now! 🎉"),
        Notification(title: "Discover a new taste sensation! A cultural eatery just popped up nearby!", subtitle: "Dive into delicious dishes from around the world! Bon appétit! 🥘🌍"),
        Notification(title: "Fashionistas, rejoice! A boutique featuring stunning cultural attire is now open nearby!", subtitle: "Explore unique styles and express your cultural flair with Groot! 👗✨"),
        Notification(title: "Calling all culture enthusiasts! An exciting cultural event is happening just a stone's throw away!", subtitle: "Immerse yourself in the vibrant traditions and experiences! Don't miss out! 🎭✨"),
        Notification(title: "Get ready for a journey of cultural discovery! An interactive exhibit showcasing diverse traditions awaits you nearby!", subtitle: "")
    ]
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        NavigationView {
            List(notifications) { notification in
                VStack(alignment: .leading, spacing: 5) {
                    Text(notification.title)
                        .font(.headline)
                        .foregroundColor(darkBlue)
                    Text(notification.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    HStack {
                        Spacer()
                        Text("Received at \(dateFormatter.string(from: notification.receivedDate))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 10)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Notifications")
                        .font(.headline)
                        .foregroundColor(darkBlue)
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
