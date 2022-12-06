//
//  ContentView.swift
//  Task 1-2-3
//
//  Created by Ogabek Matyakubov on 06/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(self.viewModel.employees, id: \.id) { employee in
                    VStack(alignment: .leading) {
                        Text("\(employee.id!). \(employee.employee_name!.uppercased())")
                            .fontWeight(.bold)
                        Text("Age: \(employee.employee_age!), Salary:\(employee.employee_salary!)")
                    }
                }
                
                if self.viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationTitle("Employees")
        }
        .onAppear {
            self.viewModel.apiEmployeeList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
