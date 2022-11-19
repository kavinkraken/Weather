//
//  ServerCallController.swift
//  Weather
//
//  Created by Kavinkumar S Thangammal on 18/11/22.
//

import UIKit

struct AppConstants {
    static var apikey = "522db6a157a748e2996212343221502"
}

class ServerCallController: NSObject {
    static func callForGet(urlString:String ,completion:@escaping (_ success: Bool,_ response : Data?, _ message: String) -> Void) -> () {
        
        let components = URLComponents(string: urlString)!
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        ServerCallController().makeURLRequest(request: request) { success, response, message in
            completion(success,response,message)
        }
    }
    
    func makeURLRequest(request:URLRequest,completion:@escaping (_ success: Bool,_ response : Data?, _ message: String) -> Void) -> () {
        debugPrint(request)
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 60.0
        let session = URLSession(configuration: sessionConfig)
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                print(data.toString() as Any)
                completion(true,data, "")
            }
            else {
                completion(false,nil,"Invalid")
            }
        }.resume()
    }
}
