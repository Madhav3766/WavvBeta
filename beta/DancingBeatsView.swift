import SwiftUI

struct DancingBeatsView: View {
    @State private var selectedGenres: Set<String> = [] // Store selected genres
    
    // Define the grid columns outside to simplify the LazyVGrid structure
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    private let genres = ["Pop", "Jazz", "Bollywood", "Rap", "Techno", "Rock", "Electro", "House", "Hip Hop", "Dance"]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        headerView(geometry: geometry)
                        
                        genreGrid(geometry: geometry)
                        
                        nextButton()
                            .padding(.top, 20)
                            .padding(.bottom, 100) // Extra bottom padding to make space for the fixed tag view
                    }
                    .padding(.horizontal, geometry.size.width * 0.05)
                    .padding(.top, geometry.size.height * 0.05)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 30/255, green: 30/255, blue: 30/255))
                }
                
                // Fixed view for selected genres at the bottom
                if !selectedGenres.isEmpty {
                    SelectedGenresView(selectedGenres: Array(selectedGenres))
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(15)
                        .padding(.horizontal, geometry.size.width * 0.05)
                        .position(x: geometry.size.width / 2, y: geometry.size.height - 40)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // Split header view into its own function
    private func headerView(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("What beats get you")
                .font(.custom("Avenir-Heavy", size: geometry.size.width * 0.09))
                .foregroundColor(.white)
                .padding(.top, 30)
            
            Text("DANCING ?")
                .font(.custom("Avenir-Heavy", size: geometry.size.width * 0.1))
                .foregroundColor(.white)
                .padding(.bottom, 20)
        }
    }
    
    // Separate LazyVGrid into its own function to reduce complexity
    private func genreGrid(geometry: GeometryProxy) -> some View {
        LazyVGrid(columns: columns, spacing: geometry.size.height * 0.02) {
            ForEach(genres, id: \.self) { genre in
                GenreButton(
                    title: genre,
                    width: geometry.size.width * 0.4,
                    height: geometry.size.height * 0.2,
                    isSelected: selectedGenres.contains(genre)
                ) {
                    toggleSelection(for: genre)
                }
            }
        }
        .offset(x: -10)
    }
    
    // Toggle the selected state of a genre
    private func toggleSelection(for genre: String) {
        if selectedGenres.contains(genre) {
            selectedGenres.remove(genre)
        } else {
            selectedGenres.insert(genre)
        }
    }
    
    // Separate Next button to improve readability
    private func nextButton() -> some View {
        HStack {
            Spacer()
            NextButton()
            Spacer()
        }
    }
}

struct GenreButton: View {
    let title: String
    let width: CGFloat
    let height: CGFloat
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .topTrailing) {
                // Background with color change based on selection
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? Color.purple : Color(red: 217/255, green: 217/255, blue: 217/255))
                    .frame(width: width, height: height)
                
                // Centered Genre title, left-aligned horizontally
                VStack() {
                    Text(title)
                        .font(.custom("Avenir-Heavy", size: 25))
                        .foregroundColor(isSelected ? .white : .black)
                        .padding(.top, -70) // Padding to keep from top
                        .padding(.leading,13) // Padding to keep from left edge
                        .padding(.leading, 0) // Left padding to prevent sticking to edge
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) // Center vertically within the button
                
                // Checkmark icon, only visible when selected
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(10)
                }
            }
        }
        .accessibility(label: Text("Select \(title) genre"))
    }
}

// Fixed view to show selected genres at the bottom of the screen

// Fixed view to show selected genres at the bottom of the screen
struct SelectedGenresView: View {
    let selectedGenres: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(selectedGenres, id: \.self) { genre in
                    Text(genre)
                        .font(.custom("Avenir-Heavy", size: 16))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.white.opacity(0.8))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
            }
            .padding(.horizontal)
        }

    }
}



struct NextButton: View {
    var body: some View {
        Button(action: {
            // Handle next action
        }) {
            Text("Next")
                .font(.custom("Avenir-Heavy", size: 24)) // Smaller font size for button
                .foregroundColor(.black)
                .frame(width: 150, height: 50) // Smaller button size
                .background(Color(red: 217/255, green: 217/255, blue: 217/255))
                .cornerRadius(25)
        }
    }
}

// Preview
struct DancingBeatsView_Previews: PreviewProvider {
    static var previews: some View {
        DancingBeatsView()
    }
}

