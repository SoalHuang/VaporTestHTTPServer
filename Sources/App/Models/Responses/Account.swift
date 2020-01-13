//
//  Account.swift
//  App
//
//  Created by SoalHunag on 2020/1/10.
//

import FluentSQLite
import Vapor

struct Account { }

extension Account {
    
    struct Request: Content {
        
        var username: String
        
        var password: String
    }
    
    struct RefreshTokenRequest: Content {
        
        var refreshToken: String
        
        enum CodingKeys: String, CodingKey {
            case refreshToken = "refresh_token"
        }
    }
}

extension Account {
    
    struct Response: Content {
        
        var id: Int?
        
        var token: String
        
        var refreshToken: String
        
        var expireIn: Int?
        
        enum CodingKeys: String, CodingKey {
            case id             = "uid"
            case token          = "token"
            case refreshToken   = "refresh_token"
            case expireIn       = "expire_in"
        }
    }
}

extension Account.Entity {
    
    var response: Account.Response {
        return Account.Response(id: id, token: token, refreshToken: refreshToken, expireIn: expireIn)
    }
}

extension Account {
    
    struct Entity: SQLiteModel {
        
        var id: Int?
        
        var username: String
        
        var password: String
        
        var token: String
        
        var refreshToken: String
        
        var expireIn: Int?
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Account.Entity: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Account.Entity: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Account.Entity: Parameter { }
