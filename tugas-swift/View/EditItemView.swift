//
//  EditItemView.swift
//  tugas-swift
//
//  Created by mg0 on 06/08/24.
//

import SwiftUI
import SwiftData

struct EditItemView: View {
    // Untuk dismiss view
    @Environment(\.presentationMode) var presentationMode
    
    // Passed value dari parent view
    @State var card: CardModel

    // Form state
    @State private var tempName: String
    
    init(card: CardModel) {
        _card = State(initialValue: card)
        _tempName = State(initialValue: card.name)
    }

    
    var body: some View {
        Form {
            Section(header: Text("Card Details")) {
                TextField("Name", text: $tempName)
            }
        }
        .navigationTitle("Edit Card")
        .navigationBarItems(trailing: Button("Save") {
            saveChanges()
            self.presentationMode.wrappedValue.dismiss()
        })
    }
    
    private func saveChanges() {
        card.name = tempName
    }
}

#Preview {
    EditItemView(card: CardModel(name: "Sample Card"))
        .modelContainer(for: CardModel.self, inMemory: true)
}
