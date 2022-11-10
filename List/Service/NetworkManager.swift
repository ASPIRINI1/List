//
//  NetworkManager.swift
//  List
//
//  Created by Станислав Зверьков on 25.10.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    var url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    
    private init() { }
    
    func getPosts(completion: @escaping ([Post]?) -> ()) {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(nil)
                return
            }
            if let response = response { print(response) }
            guard let data = data else { return }
            do {
                completion(try JSONDecoder().decode([Post].self, from: data))
            } catch {
                completion(nil)
                print(error)
            }
        }.resume()
    }
    
    func getImage(url: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async {
            do {
                completion(try Data(contentsOf: url))
            } catch {
                completion(nil)
                print(error)
            }
        }
    }
    
//    func pushPost() {
//        let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
//        let data = Data(count: 32)// Post(albumId: 0, id: 0, title: "", imageURL: "", thumbnailUrl: "")
//        URLSession.shared.uploadTask(with: request, from: data) { data, response, error in
//            print(response)
//        }
//    }
}
