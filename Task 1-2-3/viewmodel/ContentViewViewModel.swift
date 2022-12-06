//
//  ContentViewViewModel.swift
//  Task 1-2-3
//
//  Created by Ogabek Matyakubov on 06/12/22.
//

import Foundation

class ContentViewViewModel: ObservableObject {
    
    @Published var employees = [EmployeeData]()
    @Published var isLoading = false
    
    func apiEmployeeList() {
        isLoading = true
        AFHttp.get(url: AFHttp.API_EMPLOYEE_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success :
                print(response.data!)
//                let employees = try! JSONDecoder().decode(Employee.self, from: response.data!)
//                self.employees = employees.data ?? [EmployeeData]()
            case let .failure(error):
                print("Error:", error.responseCode ?? "no code")
                print(error)
            }
        })
    }
}
