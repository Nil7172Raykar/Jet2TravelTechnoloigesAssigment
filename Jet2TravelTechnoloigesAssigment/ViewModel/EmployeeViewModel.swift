//
//  EmployeeViewModel.swift
//  Jet2TravelTechnoloigesAssigment
//
//  Created by Nilesh Dnyaneshwar Raykar on 05/03/20.
//  Copyright © 2020 Nilesh Dnyaneshwar Raykar. All rights reserved.
//

import Foundation
import UIKit
class EmployeeViewModel : NSObject
{
    var employeeData = [Employee]()
    func sortEmployee(filter : Int, searchStr : String)
    {
        self.employeeData = [Employee]()
        switch filter {
        case 0:
            do {
                print("employye Name")
                self.employeeData = DatabaseHandler.databaseHandlerSharedInstance.fetchEmployee(filter: "employee_name",searchStr: searchStr)
            }
            break
        case 1 :
            do {
                print("Employee Age")
                self.employeeData = DatabaseHandler.databaseHandlerSharedInstance.fetchEmployee(filter: "employee_age",searchStr: searchStr)            }
            break
        default:
            do {
                
                self.employeeData = DatabaseHandler.databaseHandlerSharedInstance.fetchEmployee(filter:"", searchStr:searchStr)
            }
        }
    }
    
    func clearAllCoreDataRecords()
    {
        DatabaseHandler.databaseHandlerSharedInstance.clearData()
        
    }
    
    func deleteEmployee(employeeRecord : Employee)
    {
        DatabaseHandler.databaseHandlerSharedInstance.deleteEmployeeRecord(record: employeeRecord)
    }
    
    func setDataToModel(data : Data)
    {
        do
        {
            let results = try JSONDecoder().decode(ResultModel.self, from: data)
            DatabaseHandler.databaseHandlerSharedInstance.saveEmployeeDetails(dataArray: results)
//            self.sortEmployee(filter: "")
        }
        catch
        {
            
        }
    }
}


