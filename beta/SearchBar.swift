/**
 * This code was generated by Builder.io
 */
import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
            TextField("Search Event", text: $searchText)
                .foregroundColor(.white)
                
                .font(.custom("Lexend", size: 16).weight(.light))
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(190)
        .padding(.top, 25)
        .accessibility(label: Text("Search for events"))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
