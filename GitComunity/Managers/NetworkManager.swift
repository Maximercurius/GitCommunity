//
//  NetworkManager.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 06.10.2022.
//

import Foundation

class NetworkManager {
   static let shared = NetworkManager()
    let baseURL = "https://api.gihub.com/users/"
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void ) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "Invalid username")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete request")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from server")
                return
            }
            guard let data = data else {
                completed(nil, "Data is invalid")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            }
            catch {
                completed(nil, "Data is invalid" )
            }
        }
        task.resume()
    }
}
