//
//  NetworkManager.swift
//  List
//
//  Created by Станислав Зверьков on 25.10.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPosts(completion: @escaping ([Post]?) -> ())
    func getImage(url: String, completion: @escaping (Data?) -> ())
    func pushPost(post: Post, completion: @escaping (Bool) -> ())
}

class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    var url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    
    private init() { }
    
    func getPosts(completion: @escaping ([Post]?) -> ()) {
        guard let url = url else { completion(nil); return }
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
    
    func pushPost(post: Post, completion: @escaping (Bool) -> ()) {
        guard let url = url else { completion(false); return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let data = try? JSONEncoder().encode(post) else { completion(false); return }
        URLSession.shared.uploadTask(with: request, from: data) { _ , response, error in
            if let error = error {
                print(error)
                completion(false)
                return
            }
            if let response = response {
                print(response)
                completion(true)
            }
        }.resume()
    }
}
