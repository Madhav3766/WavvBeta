import SwiftUI

struct MyComponentView: View {
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottom) {
                    AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/1fb6323a9649b5eef68f95cbf4088c8146d7848fd46ec0b454aab346b8ac4adf?placeholderIfAbsent=true&apiKey=54ff05a6170d40a68992a4d816d1e6d4&format=webp")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 825)
                    
                    Button(action: {
                        // Action to perform when button is tapped
                    }) {
                        HStack {
                            Text("Get Start")
                                .foregroundColor(.white)
                                .font(.custom("Lexend", size: 24))
                            
                            Spacer() // Add a spacer to push the circle to the right
                            
                            AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/da0ecfa2d6dd4cc4d82ceafb57bc78c4a4df1b69e0a67476187c47d9f4f228dc?placeholderIfAbsent=true&apiKey=54ff05a6170d40a68992a4d816d1e6d4&format=webp")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } placeholder: {
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 64, height: 64)
                            }
                        }
                        .padding(.horizontal, 41)
                        .padding(.vertical, 10)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(40)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 23)

                }
            }
        }
        .background(Color(red: 10/255, green: 10/255, blue: 10/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MyComponentView_Previews: PreviewProvider {
    static var previews: some View {
        MyComponentView()
    }
}

