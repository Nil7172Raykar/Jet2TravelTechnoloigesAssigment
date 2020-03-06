//
//  ServiceHandler.swift
//  Jet2TravelTechnoloigesAssigment
//
//  Created by Nilesh Dnyaneshwar Raykar on 05/03/20.
//  Copyright © 2020 Nilesh Dnyaneshwar Raykar. All rights reserved.
//

import Foundation
class serviceHandler : NSObject
{
    static let  sharedInstance = serviceHandler()
    func getImageData(completion : @escaping(Data, Error?) -> ())
    {
        let urlStr = "http://dummy.restapiexample.com/api/v1/employees"
        guard let url = URL(string: urlStr)
        else {
            return
        }
        URLSession.shared.dataTask(with: url)
        {
            (data,response, error)in
            if let err = error
            {
                print("Loading data error : \(err.localizedDescription)")
            }
            else
            {
                guard let data = data else {return}
                completion(data, nil)
                
            }
        }.resume()
    }
}
