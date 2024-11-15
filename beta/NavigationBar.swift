import SwiftUI

struct NavigationBar: View {
    @State private var selectedTab: Int = 0 // Track the selected tab
    
    var body: some View {
        HStack(spacing: 30) { // Adjust spacing as needed
            ForEach(0..<4) { index in
                Button(action: {
                    selectedTab = index
                }) {
                    ZStack {
                        // Background Circle with opacity
                        Circle()
                            .fill(index == selectedTab ? Color.purple.opacity(0.5) : Color.white.opacity(0.1))
                            .frame(width: 64, height: 64)
                        
                        // Icon based on index
                        Image(systemName: iconName(for: index))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                            .foregroundColor(index == selectedTab ? .white : Color.white.opacity(0.7))
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(
            Color.black.opacity(0.2) // Background for the whole bar
                .clipShape(RoundedRectangle(cornerRadius: 30))
        )
        .padding(.horizontal, 20)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
    
    // Helper function to get icon names for each index
    func iconName(for index: Int) -> String {
        switch index {
        case 0: return "house.fill" // Home icon
        case 1: return "leaf.fill" // Explore icon
        case 2: return "bookmark.fill" // Bookmark icon
        case 3: return "gearshape.fill" // Settings icon
        default: return "questionmark"
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .preferredColorScheme(.dark) // Preview in dark mode
    }
}


