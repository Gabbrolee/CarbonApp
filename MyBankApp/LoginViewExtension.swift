//
//  LoginViewController.swift
//  MyBankApp
//
//  Created by user on 27/08/2021.
//

import Foundation

extension Login: LoginViewModelDelegate {
    
    func didReceiveLoginResponse(loginResponse: LoginResponse?) {
        
        if (loginResponse?.errorMessage == nil && loginResponse?.data != nil) {
         /* let employeeViewController = storyboard?.instantiateViewController(withIdentifier: "EmployeeViewController") as! EmployeeViewController
                self.navigationController?.pushViewController(employeeViewController, animated: true) */
            
            debugPrint("Moving to the employee's screen...")
            
        } else if (loginResponse?.errorMessage != nil) {
            
            guard let errorMessage = loginResponse?.errorMessage else {
                return
            }
            let alert = AlertService.alert(with: Constants.ErrorAlertTitle,
                                           message: errorMessage,
                                           alertStyle: .alert)
            
            self.present(alert, animated: true)
        }
    }
}
