//
//  Employee.swift
//  Task 1-2-3
//
//  Created by Ogabek Matyakubov on 06/12/22.
//

import Foundation

struct Employee: Decodable {
    var status: String?
    var data: [EmployeeData]?
    var message: String?
    
}

struct EmployeeData: Decodable {
    var id: Int?
    var employee_name: String?
    var employee_salary: Int?
    var employee_age: Int?
    var profile_image: String?
    
}
