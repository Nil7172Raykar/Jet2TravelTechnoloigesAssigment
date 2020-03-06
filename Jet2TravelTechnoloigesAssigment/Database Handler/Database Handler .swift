//
//  Database Handler .swift
//  Jet2TravelTechnoloigesAssigment
//
//  Created by Nilesh Dnyaneshwar Raykar on 05/03/20.
//  Copyright © 2020 Nilesh Dnyaneshwar Raykar. All rights reserved.
//

import CoreData
import Foundation
import UIKit
class DatabaseHandler
{
    static let databaseHandlerSharedInstance = DatabaseHandler()
    func saveEmployeeDetails(dataArray : ResultModel)
    {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        for employeeData in dataArray.data
        {
             let employeeObj = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)as! Employee
            employeeObj.id = employeeData.id
            employeeObj.employee_name = employeeData.employee_name
            employeeObj.employee_age = employeeData.employee_age
            employeeObj.employee_salary = employeeData.employee_salary
            employeeObj.profile_image = employeeData.profile_image
            do {
                try context.save()
                
            } catch {
                
                print("Failure to save context: \(error.localizedDescription)")
            }
        }
    }
   
    
    func fetchEmployee(filter : String, searchStr : String) -> [Employee]
    {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var employee = [Employee]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Employee")
        
        if(searchStr != "")
        {
            let employeeNamePredicate = NSPredicate(format: "%K CONTAINS[c] %@", "employee_name", searchStr)
            fetchRequest.predicate = employeeNamePredicate
        }
        
        if filter != ""
        {
            let sortDescriptor2 = NSSortDescriptor(key: filter, ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptor2]
        }
        do
        {
            employee = try context.fetch(fetchRequest) as! [Employee]
        }
        catch
        {
            print("Unable to fetch data")
        }
        return employee
    }
    
    func clearData()
    {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var employee = [Employee]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Employee")

        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false

        do {
            employee = try context.fetch(fetchRequest) as! [Employee]
            for item in employee {
                context.delete(item)
            }

            // Save Changes
            try context.save()

        } catch {
            // Error Handling
            // ...
        }
        
        
        
        
        
    }
    
    func deleteEmployeeRecord (record : Employee)
    {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            context.delete(record)
            // Save Changes
            try context.save()

        } catch {
            // Error Handling
            // ...
        }
    }
    
}
