import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    HeaderView()
                    SearchBar()
                    FeaturedEventCard()
                    UpcomingEventsSection()
                    EventsGrid()
                    BottomImageView()
                }
                .padding(.horizontal, 20)
                .padding(.top, 11)
                .background(Color(red: 0.039, green: 0.039, blue: 0.039))
            }
            
            // Bottom Navigation Bar
            VStack {
                Spacer() // Pushes the navigation bar to the bottom
                NavigationBar()
                    .frame(maxWidth: .infinity) // Make it span the entire width
                    .background(Color.black) // Background color for the entire bar
            }
            .edgesIgnoringSafeArea(.bottom) // Ignore safe area at the bottom
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
