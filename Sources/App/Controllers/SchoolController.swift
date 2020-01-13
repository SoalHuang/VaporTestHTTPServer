//
//  SchoolController.swift
//  App
//
//  Created by SoalHunag on 2020/1/10.
//

import Vapor

final class SchoolController {
    
    func auth(_ req: Request) throws -> Future<BaseModel<BaseModelEmptyData>> {
        return req.future(BaseModel<BaseModelEmptyData>(data: nil))
    }
    
    func logout(_ req: Request) throws -> Future<BaseModel<BaseModelEmptyData>> {
        return req.future(BaseModel<BaseModelEmptyData>(data: nil))
    }
    
    func info(_ req: Request) throws -> Future<BaseModel<School.Info>> {
        let info = School.Info(id: 111, name: "测试机构或园所", avatar: "https://static-www.putaocdn.com/pc/static/img/img_navbar_ptlogo_03.v202001061645.png")
        return req.future(info.httpContent)
    }
    
    func scheme(_ req: Request) throws -> Future<BaseModel<[School.LicesingOption]>> {
        let testString: String = "测试授权信息xxxxxxx"
        let licesings: [School.LicesingOption] = (0...(Int.random(in: 1...20))).compactMap {
            let text = (0...(Int.random(in: 1...10))).compactMap { testString + "\($0)" }.joined(separator: ",")
            let expireTime = Date().addingTimeInterval(TimeInterval.random(in: (60 * 60 * 24 * -100)...(60 * 60 * 24 * 365))).timeIntervalSince1970
            return School.LicesingOption(id: $0, name: text, expireTime: Int(expireTime))
        }.sorted {
            $0.expireTime > $1.expireTime
        }
        return req.future(licesings.httpContent)
    }
    
    func classroom(_ req: Request) throws -> Future<BaseModel<[School.Classroom]>> {
        let classrooms: [School.Classroom] = (0...(Int.random(in: 1...20))).compactMap {
            School.Classroom(id: $0, name: "葡萄编程-高级班\($0)")
        }
        return req.future(classrooms.httpContent)
    }
}
