import Fluent
import Vapor

struct TodoController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    let todos = routes.grouped("todos")
    
    todos.get(use: self.index)
    todos.post(use: self.create)
    todos.put(use: self.update)
    todos.delete(":todoID", use: self.delete)
  }
  
  @Sendable
  func index(req: Request) async throws -> [Todo] {
    try await Todo.query(on: req.db).all()
  }
  
  
  @Sendable
      func create(req: Request) async throws -> Todo {
          let todo = try req.content.decode(Todo.self) // Decode directly to Todo
          try await todo.save(on: req.db)
          return todo
      }
  
  
  @Sendable
  func update(req: Request) async throws -> Todo {
      let todo = try req.content.decode(Todo.self)
      let updatedTodo = try await Todo.find(todo.id, on: req.db)
      updatedTodo?.title = todo.title
      updatedTodo?.isCompleted = todo.isCompleted
      updatedTodo?.priority = todo.priority
      try await updatedTodo?.update(on: req.db)
      return updatedTodo ?? todo
  }
    
    
    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
      guard let todoID = req.parameters.get("todoID"),
            let uuid = UUID(uuidString: todoID), // Convert ID to UUID
            let todo = try await Todo.find(uuid, on: req.db) else {
        throw Abort(.notFound)
      }
      
      try await todo.delete(on: req.db)
      return .noContent
    }
  }
  
  
//    todos.group(":todoID") { todo in
//      todo.delete(use: self.delete)
//    }

//  @Sendable
//      func create(req: Request) async throws -> Todo {
//          let todo = try req.content.decode(TodoDTO.self).toModel()
//
//          try await todo.save(on: req.db)
//          return todo
//      }

  //@Sendable
  //    func create(req: Request) async throws -> Todo {
  //        let todo = try req.content.decode(TodoDTO.self).toModel()
  //
  //        try await todo.save(on: req.db)
  //        return todo
  //    }
  
  
  //    @Sendable
  //    func delete(req: Request) async throws -> HTTPStatus {
  //        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
  //            throw Abort(.notFound)
  //        }
  //
  //        try await todo.delete(on: req.db)
  //        return .noContent
  //    }
  //
