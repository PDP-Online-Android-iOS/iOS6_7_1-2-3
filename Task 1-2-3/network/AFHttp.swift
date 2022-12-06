//
//  AFHttp.swift
//  Task 1-2-3
//
//  Created by Ogabek Matyakubov on 06/12/22.
//

import Foundation
import Alamofire

private let IS_TESTER = true
private let SERVER_DEVELOPMENT = "https://dummy.restapiexample.com/"
private let SERVER_DEPLOYMENT = "https://dummy.restapiexample.com/"

let headers: HTTPHeaders = [
    "Accept": "application/json"
]

class AFHttp {
    
    class func get(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .get, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func post(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .post, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func put(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .put, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func del(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .delete, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    // MARK: - AFHttp Methods
    class func server(url: String) -> URL {
        if IS_TESTER {
            return URL(string: SERVER_DEVELOPMENT + url)!
        }
        return URL(string: SERVER_DEPLOYMENT + url)!
    }
    
    // MARK: - AFHttp Api
    static let API_EMPLOYEE_LIST = "api/v1/employees"
    static let API_EMPLOYEE_SINGLE = "api/v1/employee/" //id
    static let API_EMPLOYEE_CREATE = "api/v1/create"
    static let API_EMPLOYEE_UPDATE = "api/v1/update/" //id
    static let API_EMPLOYEE_DELETE = "api/v1/delete/" //id
    
    // MARK: - AFHttp Params
    
    class func paramsEmpty() -> Parameters {
        let parameters: Parameters = [:]
        return parameters
    }
    
    class func paramsEmployeeCreate(employee: EmployeeData) -> Parameters {
        let parameters: Parameters = [
            "name": employee.employee_name!,
            "salary": employee.employee_salary!,
            "age": employee.employee_age!
        ]
        return parameters
    }
    
    class func paramsEmployeeUpdate(employee: EmployeeData) -> Parameters {
        let parameters: Parameters = [
            "id": employee.id!,
            "name": employee.employee_name!,
            "salary": employee.employee_salary!,
            "age": employee.employee_age!
        ]
        return parameters
    }
}
