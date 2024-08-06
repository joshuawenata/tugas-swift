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
    
    @Query(sort: \CardModel.name) private var cards: [CardModel]
    @State private var selectedCard: CardModel = CardModel(name: "")
    
    var body: some View {
        VStack (alignment: .center){
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
            
            
            Picker("", selection: $selectedCard) { // Picker for data selection
                ForEach(cards, id: \.self) {
                    Text($0.name)
                }
            }.pickerStyle(.automatic)
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 50)
            
            Button(action: { // Button to delete the selected data
                context.delete(selectedCard)
            }) {
                Text("Delete Item")
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
