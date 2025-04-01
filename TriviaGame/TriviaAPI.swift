//
//  TriviaAPI.swift
//  TriviaGame
//
//  Created by Courtney Mahugu on 4/1/25.
//
import Foundation

class TriviaAPI {
    static func fetchTrivia(amount: Int, category: Int?, difficulty: String?, type: String?, completion: @escaping ([TriviaQuestion]) -> Void) {
        var urlComponents = URLComponents(string: "https://opentdb.com/api.php")!
        var queryItems = [
            URLQueryItem(name: "amount", value: "\(amount)")
        ]
        if let category = category {
            queryItems.append(URLQueryItem(name: "category", value: "\(category)"))
        }
        if let difficulty = difficulty {
            queryItems.append(URLQueryItem(name: "difficulty", value: difficulty))
        }
        if let type = type {
            queryItems.append(URLQueryItem(name: "type", value: type))
        }

        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let decoded = try? JSONDecoder().decode(TriviaResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded?.results ?? [])
                }
            }
        }.resume()
    }
}

