import Fluent
import struct Foundation.UUID
import Vapor

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class Todo: Model, Content,  @unchecked Sendable {
  static let schema = "todos"
  
  @ID(key: .id)
  var id: UUID?
  
  @Field(key: "title")
  var title: String
  
  @Field(key: "isCompleted")
  var isCompleted: Bool
  
//  @Field(key: "dueDate")
//  var dueDate: Date
  
  @Field(key: "priority")
  var priority: Int
  
//  @Field(key: "timestamp") 
//  var timestamp: Date
  
  
//  @Timestamp(key: "createdAt", on: .create)
//      var createdAt: Date?
//
//      @Timestamp(key: "updatedAt", on: .update)
//      var updatedAt: Date?
//  
  
  
  enum CodingKeys: String, CodingKey {
          case id, title, isCompleted, dueDate, priority
               
//               createdAt, updatedAt
      }
  
  init() { }
  
  // Add a complete initializer
      init(id: UUID? = nil, title: String, isCompleted: Bool,  priority: Int) {
          self.id = id
          self.title = title
          self.isCompleted = isCompleted
//          self.dueDate = dueDate
          self.priority = priority
      }
  
  
  required init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          id = try container.decodeIfPresent(UUID.self, forKey: .id)
          title = try container.decode(String.self, forKey: .title)
          isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
          priority = try container.decode(Int.self, forKey: .priority)
    
    
    // Decode dueDate as TimeInterval and convert to Date
//    let dueDateInterval = try container.decode(TimeInterval.self, forKey: .dueDate)
//        dueDate = Date(timeIntervalSince1970: dueDateInterval)

    
    // Decode createdAt and updatedAt if present
//            if let createdAtInterval = try container.decodeIfPresent(TimeInterval.self, forKey: .createdAt) {
//                createdAt = Date(timeIntervalSince1970: createdAtInterval)
//            }
//            if let updatedAtInterval = try container.decodeIfPresent(TimeInterval.self, forKey: .updatedAt) {
//                updatedAt = Date(timeIntervalSince1970: updatedAtInterval)
//            }
    
      }
  
  

}



// Remove the toDTO() method as it's not necessary for this model
//  func toDTO() -> TodoDTO {
//    .init(
//      id: self.id,
//      title: self.$title.value
//    )
//  }
