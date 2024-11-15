import SwiftUI

struct MyComponentView: View {
    var body: some View {
        VStack(spacing: 30) { // Adjust spacing as needed
            // Logo placeholder
            Image("logo_wavv") // Replace with your actual logo asset name
                .resizable()
                .frame(width: 265, height: 138) // Adjust size based on your logo
                .foregroundColor(.white) // Logo color, if it's a simple icon
            Text("Get started!")
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 10)
                .padding(.bottom, 0)

            // Button
            Button(action: {
                // Action to perform when button is tapped
            }) {
                ZStack {
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 64, height: 64)
                        .overlay(
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                        )
                }
                .frame(width: 64, height: 64)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Centers the content vertically and horizontally
        .background(Color(red: 10/255, green: 10/255, blue: 10/255)) // Dark background color
        .edgesIgnoringSafeArea(.all)
    }
}

struct MyComponentView_Previews: PreviewProvider {
    static var previews: some View {
        MyComponentView()
    }
}

