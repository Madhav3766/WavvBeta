/**
 * This code was generated by Builder.io
 */
import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome Back")
                    .font(.custom("Lexend", size: 14))
                    .foregroundColor(Color(red: 0.58, green: 0.64, blue: 0.72))
                Text("Agaaz Singhal")
                    .font(.custom("Lexend", size: 24).weight(.medium))
                    .foregroundColor(Color(red: 0.89, green: 0.91, blue: 0.94))
            }
            Spacer()
            
            // Logo container on the right
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.clear)
                    .frame(width: 94, height: 76)
                    
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                
                // Logo inside the container
                Image("logo_wavv") // Replace with the actual name of your logo asset
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60) // Adjust the logo size as needed
            }
        }
        .padding(.horizontal, 16)
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
