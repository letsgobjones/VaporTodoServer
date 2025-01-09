import Fluent

struct CreateTodo: AsyncMigration {
  func prepare(on database: Database) async throws {
    try await database.schema("todos")
      .id()
      .field("title", .string, .required)
      .field("isCompleted", .bool, .required)
//      .field("dueDate", .datetime, .required)
      .field("priority", .int, .required)
//      .field("createdAt", .datetime)
//      .field("updatedAt", .datetime)
      .create()
  }
  
  func revert(on database: Database) async throws {
    try await database.schema("todos").delete()
  }
}
