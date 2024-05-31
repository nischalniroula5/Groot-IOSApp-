import SwiftUI

struct OnboardingSplashView: View {
    var pages: [SplashPage] = [
        SplashPage(backgroundImage: "backgroundOne", logoImage: "GrootLogoWhite", titleText: "Cultural Crossroads", subtitleText: "Savor Authentic Flavors and Dive into Cultural Cuisine with Groot, Your Passport to Culinary Adventures.", primaryColor: Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)),
        SplashPage(backgroundImage: "backgroundTwo", logoImage: "GrootLogoWhite", titleText: "Explore New Tastes", subtitleText: "Explore amazing new tastes and rich flavors that expand your palate beyond the horizon.", primaryColor: Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)),
        SplashPage(backgroundImage: "backgroundThree", logoImage: "GrootLogoWhite", titleText: "Start Your Journey", subtitleText: "Begin your journey with us and discover the world through its food.", primaryColor: Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0))
    ]
    
    @State private var currentPageIndex = 0
    @State private var showingLoginScreen = false
    @State private var isAuthenticated = false
    
    var body: some View {
        ZStack {
            SplashView(page: pages[currentPageIndex])
            
            VStack {
                Spacer()
                HStack(spacing: 10) {
                    ForEach(pages.indices, id: \.self) { index in
                        Circle()
                            .fill(currentPageIndex == index ? pages[index].primaryColor : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.bottom, 20)
                
                Button(action: {
                    if currentPageIndex < pages.count - 1 {
                        currentPageIndex += 1
                    } else {
                        showingLoginScreen = true
                    }
                }) {
                    Text(currentPageIndex < pages.count - 1 ? "Next" : "Get Started")
                        .foregroundColor(.white)
                        .padding()
                        .background(pages[currentPageIndex].primaryColor)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .transition(.slide)
        .animation(.default)
        .fullScreenCover(isPresented: $showingLoginScreen) {
            LoginScreen(isAuthenticated: $isAuthenticated)
                }
    }
}

struct SplashView: View {
    var page: SplashPage
    
    var body: some View {
        ZStack {
            // Background image
            Image(page.backgroundImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            // Adding a dark overlay for better text readability
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            // Main content
            VStack {
                Spacer()
                
                // Logo
                Image(page.logoImage)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 20)
                
                Text(page.titleText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(page.subtitleText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct SplashPage {
    var backgroundImage: String
    var logoImage: String
    var titleText: String
    var subtitleText: String
    var primaryColor: Color
}

struct OnboardingSplashView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSplashView()
    }
}
