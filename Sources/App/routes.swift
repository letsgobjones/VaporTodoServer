import Fluent
import Vapor



func routes(_ app: Application) throws {
    // Register the TodoController
    try app.register(collection: TodoController())

    // Other routes for different parts of your application
    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    // ... more routes for other features ...
}


//
//func routes(_ app: Application) throws {
//    app.get { req async in
//        "It works!"
//    }
//
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }
//
//    try app.register(collection: TodoController())
//}


//
//func routes(_ app: Application) throws {
//    app.get("todos") { req async throws -> [Todo] in
//        try await Todo.query(on: req.db).all()
//    }
//
//    app.post("todos") { req async throws -> Todo in
//        let model = try req.content.decode(Todo.self)
//        try await model.save(on: req.db)
//        return model
//    }
//  
//  app.get("todos", ":todoID") { req async throws -> Todo in
//          guard let todoID = req.parameters.get("todoID"),
//                let uuid = UUID(uuidString: todoID),
//                let todo = try await Todo.find(uuid, on: req.db) else {
//              throw Abort(.notFound)
//          }
//          return todo
//      }
//
//      app.put("todos", ":todoID") { req async throws -> Todo in
//          guard let todoID = req.parameters.get("todoID"),
//                let uuid = UUID(uuidString: todoID),
//                let existingTodo = try await Todo.find(uuid, on: req.db) else {
//              throw Abort(.notFound)
//          }
//
//          let updatedTodo = try req.content.decode(Todo.self)
//          existingTodo.title = updatedTodo.title
//          existingTodo.isCompleted = updatedTodo.isCompleted
//          existingTodo.priority = updatedTodo.priority
//
//          try await existingTodo.update(on: req.db)
//          return existingTodo
//      }
//
//      app.delete("todos", ":todoID") { req async throws -> HTTPStatus in
//          guard let todoID = req.parameters.get("todoID"),
//                let uuid = UUID(uuidString: todoID),
//                let todo = try await Todo.find(uuid, on: req.db) else {
//              throw Abort(.notFound)
//          }
//
//          try await todo.delete(on: req.db)
//          return .noContent
//      }
//  
//  
//  
//  
//  
//
//    // Add other routes for GET by ID, PUT, DELETE as needed
//}
