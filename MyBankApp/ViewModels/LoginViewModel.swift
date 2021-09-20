//
//  LoginViewModel.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

protocol LoginViewModelDelegate {
  func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

class LoginViewModel {
  
  var delegate: LoginViewModelDelegate?
  
  func loginUser(loginRequest: LoginRequest) {
    
    let validationResult = LoginValidation().validate(loginRequest: loginRequest)
    
    if (validationResult.success) {
      
      // Use loginResult to call Login API
      let loginResource = LoginResource()
      loginResource.loginUser(loginRequest: loginRequest) { (loginAPIResponse) in
        guard
          loginAPIResponse?.errorMessage == nil,
          loginAPIResponse?.data != nil,
          let userID = loginAPIResponse?.data?.userID else {
          return
        }
        
        UserDefaultUtility.saveUserID(userID: userID)
      
        DispatchQueue.main.async {
          self.delegate?.didReceiveLoginResponse(loginResponse: loginAPIResponse)
        }
      }
    }
    
    self.delegate?.didReceiveLoginResponse(loginResponse:
                                            LoginResponse(errorMessage:
                                                            validationResult.error,
                                                          data: nil))
  }
}
