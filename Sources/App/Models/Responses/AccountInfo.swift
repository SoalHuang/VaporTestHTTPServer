//
//  AccountInfo.swift
//  App
//
//  Created by SoalHunag on 2020/1/10.
//

import FluentSQLite
import Vapor

struct AccountInfo: SQLiteModel {
    
    var id: Int?
    
    var name: String?
    
    var avatar: String?
}

/// Allows `Todo` to be used as a dynamic migration.
extension AccountInfo: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension AccountInfo: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension AccountInfo: Parameter { }
