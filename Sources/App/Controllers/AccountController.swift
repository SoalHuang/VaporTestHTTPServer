//
//  AccountController.swift
//  App
//
//  Created by SoalHunag on 2020/1/10.
//

import Vapor

final class AccountController {
    
    func login(_ req: Request) throws -> Future<BaseModel<Account.Response>> {
        return try req.content.decode(Account.Request.self).map(to: BaseModel<Account.Response>.self) { _ in
            Account.Response(id: 999, token: "tokenxxxxxxx", refreshToken: "refreshTokenxxxxxxx", expireIn: 600).httpContent
        }
    }
    
    func refreshToken(_ req: Request) throws -> Future<BaseModel<Account.Response>> {
        return try req.content.decode(Account.RefreshTokenRequest.self).map(to: BaseModel<Account.Response>.self) { _ in
            Account.Response(id: 999, token: "tokenxxxxxxx\(Int.random(in: 0...999))", refreshToken: "refreshTokenxxxxxxx\(Int.random(in: 0...999))", expireIn: 600).httpContent
        }
    }
}
