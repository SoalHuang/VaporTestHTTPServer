import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    
    let accountController = AccountController()
    router.post("api/login", use: accountController.login)
    router.post("api/refresh/token", use: accountController.refreshToken)
    
    
    let schoolController = SchoolController()
    router.post("api/org/auth", use: schoolController.auth)
    router.post("api/org/logout", use: schoolController.logout)
    router.get("api/org/info", use: schoolController.info)
    router.get("api/scheme", use: schoolController.scheme)
    router.get("api/org/111/classrooms", use: schoolController.classroom)
    
    
    let teacherController = TeacherController()
    router.post("api/teacher/logout", use: teacherController.logout)
    router.get("api/teacher/info", use: teacherController.info)
    router.post("api/teacher/choice/classroom", use: teacherController.selectClassroom)
    

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
