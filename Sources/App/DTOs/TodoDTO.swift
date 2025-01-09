import Fluent
import Vapor

struct TodoDTO: Content {
    var id: UUID?
    var title: String?
    
    func toModel() -> Todo {
        let model = Todo()
        
        model.id = self.id
        if let title = self.title {
            model.title = title
        }
        return model
    }
}


//import Fluent
//import Vapor
//
//struct TodoDTO: Content {
//  var id: UUID?
//  var title: String?
//  var isCompleted: Bool?
//  var priority: Int?// Add isCompleted
//  
//  func toModel() -> Todo {
//    let model = Todo()
//    
//    model.id = self.id
//    if let title = self.title {
//      model.title = title
//    }
//    if let isCompleted = self.isCompleted {
//      model.isCompleted = isCompleted
//    }
//    model.priority = self.priority // Set priority
//    return model
//  }
//}
