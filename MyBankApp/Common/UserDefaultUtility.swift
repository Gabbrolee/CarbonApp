//
//  File.swift
//  TheEmployees
//
//  Created by user on 19/08/2021.
//

import UIKit

struct UserDefaultUtility {
  
  static func saveUserID(userID: Int) {
    UserDefaults.standard.setValue(userID, forKey: "userID")
  }
  
  static func getUserID() -> Int {
    return UserDefaults.standard.value(forKey: "userID") as! Int
  }
}
