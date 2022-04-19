//
//  APIManager.swift
//  SingletonPractice
//
//  Created by Nelson Aquino Jr  on 4/19/22.
//

import Foundation

class APIManager {
    
    // Create a static let variable to provide an access point
    static let shared = APIManager()
    
    // Prevention of instance creation
    private init() {}
    
    func load(urlString: String, completion: @escaping (Vehicle) -> () ){
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            do {
                let model = try JSONDecoder().decode(Vehicle.self, from: data)
                completion(model)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
}
