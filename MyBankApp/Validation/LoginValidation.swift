//
//  LoginValidation.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

struct LoginValidation {
    
    func validate(loginRequest: LoginRequest) -> ValidationResult {
        
        if (loginRequest.userEmail!.isEmpty) {
            return ValidationResult(success: false, error: "User email cannot be empty!")
        }
        
        if (loginRequest.userPassword!.isEmpty) {
            return ValidationResult(success: false, error: "User password is empty!")
        }
        
        return ValidationResult(success: true, error: nil)
    }
}
