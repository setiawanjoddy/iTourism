//
//  Network.swift
//  iTourism
//
//  Created by Setiawan Joddy on 18/07/21.
//

import Foundation

struct NetworkHelper {
    
    func parse(complete: @escaping ([Place]) -> Void ){
        let url = URL(string: "https://tourism-api.dicoding.dev/list")
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            
            guard let safeData = data else { return }
            do {
                let result = try JSONDecoder().decode(TourismData.self, from: safeData)
                DispatchQueue.main.async {
                    complete(result.places)
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
