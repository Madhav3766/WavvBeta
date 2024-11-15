import SwiftUI

struct DancefloorSearchView: View {
    @State private var searchText = ""
    @State private var selectedClubs: [String] = [] // Track multiple selected clubs
    
    let clubTitles = ["Da Bodega", "Seville", "Zeek", "Kakuna"] // List of club titles

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: geometry.size.height * 0.02) {
                    
                    // Main Title Text
                    Text("What's your ultimate")
                        .font(.custom("Lexend", size: geometry.size.width * 0.065))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, geometry.size.height * 0.1)
                        .accessibilityAddTraits(.isHeader).padding(.top,20)
                    
                    Text("DANCEFLOOR?")
                        .font(.custom("Lexend", size: geometry.size.width * 0.08))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, geometry.size.height * 0.02)
                        .accessibilityAddTraits(.isHeader)
                    
                    // Search Bar
                    SearchBar1(text: $searchText)
                        .onChange(of: searchText) { newValue in
                            selectClub(byName: newValue)
                        }
                        .padding(.bottom, geometry.size.height * 0.05)
                    
                    // Subtitle Text
                    Text("Popular clubs in your city:-")
                        .font(.custom("Lexend", size: geometry.size.width * 0.065))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, geometry.size.height * 0.02)
                        .accessibilityAddTraits(.isHeader)
                    
                    // Club View Boxes with image and text field overlay
                    ClubView(imageName: "Image", title: "Da Bodega", isSelected: selectedClubs.contains("Da Bodega")) {
                        toggleSelection(for: "Da Bodega")
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                    .padding(.bottom, geometry.size.height * 0.03)
                    
                    ClubView(imageName: "Image 1", title: "Seville", isSelected: selectedClubs.contains("Seville")) {
                        toggleSelection(for: "Seville")
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                    .padding(.bottom, geometry.size.height * 0.03)
                    
                    ClubView(imageName: "Image 2", title: "Zeek", isSelected: selectedClubs.contains("Zeek")) {
                        toggleSelection(for: "Zeek")
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                    .padding(.bottom, geometry.size.height * 0.03)
                    
                    ClubView(imageName: "Image", title: "Kakuna", isSelected: selectedClubs.contains("Kakuna")) {
                        toggleSelection(for: "Kakuna")
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                    .padding(.bottom, geometry.size.height * 0.03)
                    
                    // Next Button
                    NextButton1()
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.08)
                        .padding(.bottom, geometry.size.height * 0.05)
                        .padding(.horizontal, geometry.size.width * 0.2)
                }
                .padding(.horizontal, geometry.size.width * 0.05)
            }
            .background(Color(red: 30/255, green: 30/255, blue: 30/255))
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    // Toggle selection for the given club title
    private func toggleSelection(for club: String) {
        if selectedClubs.contains(club) {
            selectedClubs.removeAll { $0 == club }
        } else {
            selectedClubs.append(club)
        }
    }
    
    // Select club by name when the search text matches a club title
    private func selectClub(byName name: String) {
        // Check if the name matches a club title and is not already selected
        if clubTitles.contains(name) && !selectedClubs.contains(name) {
            selectedClubs.append(name)
        }
    }
}

struct SearchBar1: View {
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 10) {
            // Search icon inside the bar
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
                .accessibilityLabel("Search icon")
            
            // Text field
            TextField("Search for clubs", text: $text)
                .padding(.vertical, 10)
                .accessibilityLabel("Search for clubs")
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.8))
        .cornerRadius(20)
        .padding(.horizontal, 05)
        .frame(height: 10)
    }
}

struct ClubView: View {
    var imageName: String
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .bottomLeading) {
                // Background image from local asset
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 400, maxHeight: 150)
                    .clipped()
                    .overlay(isSelected ? Color.black.opacity(0.4) : Color.clear) // Dark overlay when selected
                
                // Text overlay
                Text(title)
                    .font(.custom("Lexend", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
                    .padding([.leading, .bottom], 15)
            }
            .cornerRadius(20)
            .shadow(radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.purple : Color.clear, lineWidth: 3) // Blue border when selected
            )
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("\(title) club image")
        }
        .buttonStyle(PlainButtonStyle()) // Removes default button style
    }
}

struct NextButton1: View {
    var body: some View {
        Button(action: {
            // Handle next action
        }) {
            Text("Next")
                .frame(width: 150, height: 50)
                .background(Color.white.opacity(0.8))
                .foregroundColor(.black)
                .cornerRadius(200)
                .font(.custom("Lexend", size: 24))
                .fontWeight(.bold)
        }
        .accessibilityLabel("Next button")
    }
}

struct DancefloorSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DancefloorSearchView()
    }
}

