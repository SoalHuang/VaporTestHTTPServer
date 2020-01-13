//
//  BaseModels.swift
//  App
//
//  Created by SoalHunag on 2020/1/10.
//

import FluentSQLite
import Vapor

struct BaseModelEmptyData: Content { }

struct BaseModel<DataType: Content>: Content {
    
    var code: Int = 0
    
    var message: String = ""
    
    var data: DataType?
    
    init(code: Int = 0, message: String = "", data: DataType? = nil) {
        self.code = code
        self.message = message
        self.data = data
    }
}

extension Content {
    
    var httpContent: BaseModel<Self> {
        return BaseModel<Self>(data: self)
    }
}
