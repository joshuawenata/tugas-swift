//
//  HomeView.swift
//  tugas-swift
//
//  Created by Joshua Wenata Sunarto on 05/08/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var context
    @State private var cardName: String = ""
    
    var body: some View {
        VStack {
            TextField("Card Name", text: $cardName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                let card = CardModel(name: cardName)
                context.insert(card)
                cardName = ""
            }) {
                Text("Add Item")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}
