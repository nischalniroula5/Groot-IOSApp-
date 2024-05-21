import SwiftUI

struct ContentView: View {
    
    var primaryColor = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    var body: some View {
        ZStack {
            // Background image
            Image("backgroundOne")
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
                Image("GrootLogoWhite")
                    .resizable()
                    .frame(width: 120, height: 120)
                    //.background(Circle().fill(Color.white))
                    .padding(.bottom, 20)
                
                Spacer()
                VStack {
                    Text("Cultural Crossroads")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Savor Authentic Flavors and Dive into Cultural Cuisine with Groot, Your Passport to Culinary Adventures.")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.bottom, 34)
                
                //Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // Action for continue
                    }) {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            
                            .padding()
                            
                        Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding([.trailing, .top, .bottom])
                    }
                .padding(.horizontal)
                .background(primaryColor)
                .cornerRadius(25)
                .padding(.horizontal)
                }
                .padding(.bottom, 50)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
