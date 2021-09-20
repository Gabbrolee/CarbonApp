//
//  LoginRequest.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

struct LoginRequest: Encodable {
    
    var userEmail: String?
    var userPassword: String?
}
