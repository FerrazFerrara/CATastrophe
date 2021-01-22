//
//  APICall.swift
//  CATastrophe
//
//  Created by Ferraz on 22/01/21.
//

import Foundation

class APICall {
    public func getCat(category: Int, completion: @escaping([CatImage]?) -> Void){
        guard let url = NSURL(string: "https://api.thecatapi.com/v1/images/search?category_ids=\(category)") else { completion(nil); return }
        
        let request = NSMutableURLRequest(url: url as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                print(error as Any)
                completion(nil)
                return
            }
            
            do {
                guard let data = data else { completion(nil); return }
                let json = try JSONDecoder().decode([CatImage].self, from: data)
                
                completion(json)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        
        dataTask.resume()
    }
    
    public func getCategories(completion: @escaping([Category]?) -> Void){
        let headers = ["x-api-key": "917df3c8-8f3d-4f6e-84b7-b3de45512087"]
        
        guard let url = NSURL(string: "https://api.thecatapi.com/v1/categories") else { completion(nil); return }
        
        let request = NSMutableURLRequest(url: url as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                print(error as Any)
                completion(nil)
                return
            }
                
            do {
                let json = try JSONDecoder().decode([Category].self, from: data!)
                
                completion(json)
            } catch {
                completion(nil)
                print("Error: \(error.localizedDescription)")
            }
        }
        
        dataTask.resume()
    }
}
