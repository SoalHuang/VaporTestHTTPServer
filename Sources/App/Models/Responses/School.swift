//
//  School.swift
//  App
//
//  Created by SoalHunag on 2020/1/10.
//

import FluentSQLite
import Vapor

struct School {
    
    typealias Info = AccountInfo
    
    struct LicesingOption: SQLiteModel {
        
        var id: Int?
        
        var name: String
        
        var expireTime: Int
        
        enum CodingKeys: String, CodingKey {
            case name       = "course_name"
            case expireTime = "expired_time"
        }
    }
    
    struct Classroom: SQLiteModel {
        
        var id: Int?
        
        var name: String
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension School.LicesingOption: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension School.LicesingOption: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension School.LicesingOption: Parameter { }


/// Allows `Todo` to be used as a dynamic migration.
extension School.Classroom: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension School.Classroom: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension School.Classroom: Parameter { }
