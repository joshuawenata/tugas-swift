//
//  ItemView.swift
//  tugas-swift
//
//  Created by Joshua Wenata Sunarto on 05/08/24.
//

import SwiftUI
import SwiftData

struct ItemView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \CardModel.name) private var cards: [CardModel]

    var body: some View {
        NavigationStack{
            if cards.isEmpty {
                ContentUnavailableView("Enter your first Cards",
                                       systemImage: "menucard.fill")
            } else {
                List{
                    ForEach(cards) { card in
                        NavigationLink{
                            EditItemView(card: card)
                        } label: {
                            Text(card.name)
                                .font(.title2)
                        }
                        
                    }
                    .onDelete{ IndexSet in
                        for index in IndexSet {
                            context.delete(cards[index])
                        }
                        
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Cards")
                
            }
        }
    }
    
}

#Preview {
    ItemView()
        .modelContainer(for: CardModel.self, inMemory: true)
}
