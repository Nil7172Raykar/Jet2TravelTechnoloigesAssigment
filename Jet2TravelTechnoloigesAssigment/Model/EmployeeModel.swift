//
//  EmployeeModel.swift
//  Jet2TravelTechnoloigesAssigment
//
//  Created by Nilesh Dnyaneshwar Raykar on 05/03/20.
//  Copyright © 2020 Nilesh Dnyaneshwar Raykar. All rights reserved.
//

import Foundation

class EmployeeModel : Decodable
{
    var employee_name : String?
    var id : String?
    var employee_age : String?
    var profile_image : String?
    var employee_salary : String?
    var searchStr : String?
    init(employee_name : String, id : String, employee_age : String, profile_image: String, employee_salary : String)
    {
        self.employee_name = employee_name
        self.id = id
        self.employee_age = employee_age
        self.profile_image = profile_image
        self.employee_salary = employee_salary
    }
}

class ResultModel : Decodable
{
    var data = [EmployeeModel]()
    init(data : [EmployeeModel])
    {
        self.data = data
    }
}
