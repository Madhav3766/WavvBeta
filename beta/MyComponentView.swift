import SwiftUI

// Custom Modifier to handle font and opacity
struct CustomTextModifier: ViewModifier {
    let font: Font
    let opacity: Double
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .opacity(opacity)
            .foregroundColor(.white)
    }
}

struct MyComponentView: View {
    @State private var sliderOffset: CGFloat = 0
    @State private var hasNavigated = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer() // Spacer to push the logo to the center

                // Logo
                Image("logo_wavv") // Replace with your actual logo asset name
                    .resizable()
                    .frame(width: 265, height: 138)
                    .foregroundColor(.white)

                Spacer()
                
                // Slider at the bottom
                BottomSlider(sliderOffset: $sliderOffset, hasNavigated: $hasNavigated)
                    .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 10/255, green: 10/255, blue: 10/255))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BottomSlider: View {
    @Binding var sliderOffset: CGFloat
    @Binding var hasNavigated: Bool
    private let sliderWidth: CGFloat = 300
    private let threshold: CGFloat = 200 // Distance required to complete the slide

    var body: some View {
        ZStack {
            // Background track
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.gray.opacity(0.2))
                .frame(width: sliderWidth, height: 60)
            
            // "Let's Party" Text with custom modifier
            Text("Let's Party")
                .modifier(CustomTextModifier(
                    font: Font.custom("Lexend", size: 18),
                    opacity: Double(1 - (sliderOffset / threshold))
                ))
            
            // Slider button
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 5)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                }
                .offset(x: sliderOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if gesture.translation.width >= 0 && gesture.translation.width <= sliderWidth - 60 {
                                sliderOffset = gesture.translation.width
                            }
                        }
                        .onEnded { _ in
                            if sliderOffset > threshold {
                                hasNavigated = true
                            } else {
                                sliderOffset = 0
                            }
                        }
                )
                
                Spacer()
            }
            .padding(.leading, 5)
        }
        .padding(.bottom, 30)
        .frame(width: sliderWidth)
        
        // Navigation to ContentView when fully slid
        NavigationLink(destination: LoginView(), isActive: $hasNavigated) {
            EmptyView()
        }
        .hidden()
    }
}

struct MyComponentView_Previews: PreviewProvider {
    static var previews: some View {
        MyComponentView()
    }
}

