//
//  HttpUtility.swift
//  TheEmployees
//
//  Created by waheedCodes on 15/08/2021.
//

import Foundation

struct HTTPUtility {
    
    func getAPIData<T: Decodable>(requestURL: URL, resultType: T.Type, completion: @escaping (_ result: T?) -> Void) {
        
        URLSession.shared.dataTask(with: requestURL) { (responseData, httpURLResponse, error) in
            
            if (error == nil && responseData != nil && responseData?.count != 0) {
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    completion(result)
                } catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func postAPIData<T: Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completion:@escaping(_ result: T)-> Void) {
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

            if (data != nil && data?.count != 0) {
                let decoder = JSONDecoder()
                
                do {
                    let response = try decoder.decode(T.self, from: data!)
                    completion(response)
                } catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
}
