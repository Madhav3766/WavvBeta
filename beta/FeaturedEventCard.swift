/**
 * This code was generated by Builder.io
 */
import SwiftUI

struct FeaturedEventCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/54ff05a6170d40a68992a4d816d1e6d4/73b55f0396a0cbe8e72a1d4f603715fd46e21a4e876f8f43672e7ecae3fbaa81?apiKey=54ff05a6170d40a68992a4d816d1e6d4&&format=webp")) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .aspectRatio(1.687, contentMode: .fill)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "calendar")
                        Text("08 OCT 2024")
                    }
                    .font(.custom("Lexend", size: 12).weight(.light))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(150)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/54ff05a6170d40a68992a4d816d1e6d4/02c43904ff6cd3e7678071e7a6b24839c283d75912b084f931d45673b6229530?apiKey=54ff05a6170d40a68992a4d816d1e6d4&&format=webp")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 38, height: 38)
                        .clipShape(Circle())
                    }
                }
                .padding(20)
            }
            
            Text("Sun Beat Feast")
                .font(.custom("Lexend", size: 16).weight(.medium))
                .foregroundColor(Color(red: 0.89, green: 0.91, blue: 0.94))
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
        }
        .background(Color.white)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
        .padding(.top, 25)
    }
}