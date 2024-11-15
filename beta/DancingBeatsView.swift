⁠ import SwiftUI

struct DancingBeatsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                Text("What beats get you")
                    .font(.custom("Lexend-Bold", size: 64))
                    .foregroundColor(.white)
                
                Text("DANCING ?")
                    .font(.custom("Lexend-Bold", size: 128))
                    .foregroundColor(.white)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    GenreButton(title: "Pop")
                    GenreButton(title: "Jazz")
                    GenreButton(title: "Bollywood")
                    GenreButton(title: "Rap")
                    GenreButton(title: "Techno")
                    GenreButton(title: "Rock")
                    GenreButton(title: "Electro")
                    GenreButton(title: "House")
                    GenreButton(title: "Hip Hop")
                    
                    VStack(alignment: .leading) {
                        Text("Dance")
                            .font(.custom("Lexend-Bold", size: 64))
                            .foregroundColor(.black)
                            .padding(.leading, 35)
                        
                        Button(action: {
                            // Handle next action
                        }) {
                            Text("Next")
                                .font(.custom("Lexend-Bold", size: 64))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: 194)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(200)
                        }
                        .accessibility(label: Text("Proceed to next step"))
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 217/255, green: 217/255, blue: 217/255))
                    .cornerRadius(20)
                }
            }
            .padding(.horizontal, 80)
            .padding(.top, 153)
            .frame(maxWidth: .infinity)
            .background(Color(red: 30/255, green: 30/255, blue: 30/255))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct GenreButton: View {
    let title: String
    
    var body: some View {
        Button(action: {
            // Handle genre selection
        }) {
            Text(title)
                .font(.custom("Lexend-Bold", size: 64))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 420)
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
} ⁠