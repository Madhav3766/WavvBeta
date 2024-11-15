import SwiftUI

struct DancingBeatsView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: geometry.size.height * 0.04) {
                    Text("What beats get you")
                        .font(.custom("Lexend-Bold", size: geometry.size.width * 0.09))
                        .foregroundColor(.white)
                        .padding(.top,30)
                    
                    Text("DANCING ?")
                        .font(.custom("Lexend-Bold", size: geometry.size.width * 0.1))
                        .foregroundColor(.white)
                    
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: geometry.size.height * 0.02) {
                        GenreButton(title: "Pop", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        GenreButton(title: "Jazz", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        GenreButton(title: "Bollywood", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        GenreButton(title: "Rap", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        GenreButton(title: "Techno", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        GenreButton(title: "Rock", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        GenreButton(title: "Electro", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        GenreButton(title: "House", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        GenreButton(title: "Hip Hop", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        GenreButton(title: "Dance", width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        
                    }
                    
                    // Next button section
                    Button(action: {
                        // Handle next action
                    }) {
                        Text("Next")
                            .font(.custom("Lexend-Bold", size: geometry.size.width * 0.1))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: geometry.size.height * 0.15)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(geometry.size.height * 0.1)
                    }
                    .padding(.horizontal, geometry.size.width * 0.05)
                    .accessibility(label: Text("Proceed to next step"))
                }
                .padding(.horizontal, geometry.size.width * 0.05)
                .padding(.top, geometry.size.height * 0.1)
                .frame(maxWidth: .infinity)
                .background(Color(red: 30/255, green: 30/255, blue: 30/255))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct GenreButton: View {
    let title: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Button(action: {
            // Handle genre selection
        }) {
            Text(title)
                .font(.custom("Lexend-Bold", size: width * 0.16))
                .foregroundColor(.black)
                .frame(width: width, height: height)
                .background(Color(red: 217/255, green: 217/255, blue: 217/255))
                .cornerRadius(20)
        }
        .accessibility(label: Text("Select \(title) genre"))
    }
}

struct DancingBeatsView_Previews: PreviewProvider {
    static var previews: some View {
        DancingBeatsView()
    }
}

