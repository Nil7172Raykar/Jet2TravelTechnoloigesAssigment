//
//  EmployeeTableViewCell.swift
//  Jet2TravelTechnoloigesAssigment
//
//  Created by Nilesh Dnyaneshwar Raykar on 05/03/20.
//  Copyright © 2020 Nilesh Dnyaneshwar Raykar. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet var employeeProfileImageview: UIImageView!
    
    @IBOutlet var employeeAgeLbl: UILabel!
    @IBOutlet var employeeNameLbl: UILabel!
    @IBOutlet var employeeIDLbl: UILabel!
    @IBOutlet var salaryLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
