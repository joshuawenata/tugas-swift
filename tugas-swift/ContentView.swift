import SwiftUI
import SwiftData

struct ContentView: View {
    
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [CardModel]
    
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "plus.app.fill")
                    Text("Home")
                }
            
            ItemView()
                .tabItem {
                    Image(systemName: "person.text.rectangle.fill")
                    Text("Items")
                }
        }
    }
}

#Preview {
    ContentView()
}
