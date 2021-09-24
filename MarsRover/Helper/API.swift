//
//  API.swift
//  MarsRover
//
//  Created by Mert Yılmaz on 20.09.2021.
//

import Foundation
import Alamofire

class API {
    
    static let shared = API()
    
    func fetchData(url: String, completion: @escaping(RoverData?) -> Void) {
        AF.request(url, method: .get).response { (responseData) in
            guard let data = responseData.data else {return}
            do {
                let model = try JSONDecoder().decode(RoverData.self, from: data)
                completion(model)
            } catch {
                print(error)
            }
        }
    }
    
}
