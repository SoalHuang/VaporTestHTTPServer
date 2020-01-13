//
//  TeacherController.swift
//  App
//
//  Created by SoalHunag on 2020/1/10.
//

import Vapor

final class TeacherController {
    
    func logout(_ req: Request) throws -> Future<BaseModel<BaseModelEmptyData>> {
        return req.future(BaseModel<BaseModelEmptyData>(data: nil))
    }
    
    func info(_ req: Request) throws -> Future<BaseModel<Teacher.Info>> {
        let info = Teacher.Info(id: 222, name: "XXX老师", avatar: "https://static-www.putaocdn.com/pc/static/img/img_navbar_ptlogo_03.v202001061645.png")
        return req.future(info.httpContent)
    }
    
    func selectClassroom(_ req: Request) throws -> Future<BaseModel<BaseModelEmptyData>> {
        return req.future(BaseModel<BaseModelEmptyData>(data: nil))
    }
}
