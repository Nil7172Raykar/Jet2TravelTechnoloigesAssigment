//
//  EmployeeListViewController.swift
//  Jet2TravelTechnoloigesAssigment
//
//  Created by Nilesh Dnyaneshwar Raykar on 05/03/20.
//  Copyright © 2020 Nilesh Dnyaneshwar Raykar. All rights reserved.
//

import UIKit
class EmployeeListViewController: UIViewController
{
    var refreshControl: UIRefreshControl!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var employeeFilterSegment: UISegmentedControl!
    @IBOutlet var employeeTable: UITableView!
     var employeeViewModelObj = EmployeeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refreshData), for: UIControl.Event.valueChanged)
        employeeTable.addSubview(refreshControl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.refreshData()
    }
    
    @IBAction func employeeFilterSegmentButtonclicked(_ sender: Any)
    {
        employeeViewModelObj.sortEmployee(filter: employeeFilterSegment.selectedSegmentIndex,searchStr: self.searchBar.text ?? "")
       
        self.employeeTable.reloadData()
    }
    
     func fetchDataFromServer()
        {
            serviceHandler.sharedInstance.getImageData{(data, error) in
                if(error == nil)
                {
                    self.employeeViewModelObj.setDataToModel(data: data)
                    DispatchQueue.main.async {
                        self.employeeViewModelObj.sortEmployee(filter: self.employeeFilterSegment.selectedSegmentIndex, searchStr: self.searchBar.text ?? "")
                        self.employeeTable.reloadData()
                    }
                   
                }
            }
        }
    
    @objc func refreshData()
    {
        employeeViewModelObj.clearAllCoreDataRecords()
        self.fetchDataFromServer()
    }
}

extension EmployeeListViewController : UITableViewDataSource,UITableViewDelegate
{
    public func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.employeeViewModelObj.employeeData.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        let employeeData = self.employeeViewModelObj.employeeData[indexPath.row]
//        cell.employeeProfileImageview.image =
        cell.employeeNameLbl.text = employeeData.employee_name
        cell.employeeIDLbl.text = employeeData.id
        cell.employeeAgeLbl.text = employeeData.employee_age
        cell.salaryLbl.text = employeeData.employee_salary
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
     
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            DispatchQueue.main.async
                {
                    self.employeeViewModelObj.deleteEmployee(employeeRecord: self.employeeViewModelObj.employeeData[indexPath.row])
                    self.employeeViewModelObj.employeeData.remove(at: indexPath.row)
                    self.employeeTable.reloadData()
            }
        })
        deleteAction.backgroundColor = UIColor.red
        
        return [deleteAction]
    }
    
    
}

extension EmployeeListViewController : UISearchBarDelegate
{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        employeeViewModelObj.sortEmployee(filter: employeeFilterSegment.selectedSegmentIndex,searchStr: self.searchBar.text ?? "")
         self.employeeTable.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        employeeViewModelObj.sortEmployee(filter: employeeFilterSegment.selectedSegmentIndex,searchStr: self.searchBar.text ?? "")
        self.employeeTable.reloadData()
    }
}
