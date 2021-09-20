//
//  LoginResource.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

struct LoginResource {
    
    func loginUser(loginRequest: LoginRequest, completionHandler: @escaping (_ result: LoginResponse?) -> Void) {
        
        let loginURL = URL(string: ApiEndpoints.Login)!
        let httpUtility = HTTPUtility()
        
        do {
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            httpUtility.postAPIData(requestUrl: loginURL, requestBody: loginPostBody, resultType: LoginResponse.self) { loginAPIResponse in
                
                completionHandler(loginAPIResponse)
            }
            
        } catch let error {
            debugPrint(error)
        }
    }
}
