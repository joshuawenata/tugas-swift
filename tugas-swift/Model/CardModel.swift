import Foundation
import SwiftData

@Model
class CardModel: Identifiable{
 
    var id: UUID = UUID()
    var name: String
        
    init(name: String){
        self.name = name
    }
}
