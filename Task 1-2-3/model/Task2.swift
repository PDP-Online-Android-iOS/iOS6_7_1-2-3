//
//  Task2.swift
//  Task 1-2-3
//
//  Created by Ogabek Matyakubov on 06/12/22.
//

import Foundation

struct Task2 {
    var orders: [Order]
}

struct Order {
    var orderno: String
    var date: String
    var trackingno: String
    var custid: String
    var customer: [Customer]
}

struct Customer {
    var custid: String
    var fname: String
    var lname: String
    var address: String
    var city: String
    var state: String
    var zip: String
}
