//
//  ItemView.swift
//  tugas-swift
//
//  Created by Joshua Wenata Sunarto on 05/08/24.
//

import SwiftUI
import SwiftData

struct ItemView: View {
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
                            Text(card.name)
                        } label: {
                            Text(card.name)
                                .font(.title2)
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
