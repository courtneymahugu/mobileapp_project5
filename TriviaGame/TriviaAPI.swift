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
        
        // ✅ Build the query
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

        // ✅ Print final URL for debugging
        if let debugURL = urlComponents.url {
            print("Trivia API URL: \(debugURL.absoluteString)")
        }

        // ✅ Ensure URL is valid
        guard let url = urlComponents.url else {
            print("Invalid URL")
            DispatchQueue.main.async { completion([]) }
            return
        }

        // ✅ Call API safely
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("API request error: \(error.localizedDescription)")
                DispatchQueue.main.async { completion([]) }
                return
            }

            guard let data = data else {
                print("No data returned from server")
                DispatchQueue.main.async { completion([]) }
                return
            }

            // ✅ Try decoding the response
            do {
                let decoded = try JSONDecoder().decode(TriviaResponse.self, from: data)
                DispatchQueue.main.async {
                    if decoded.results.isEmpty {
                        print("No trivia questions returned — maybe no questions match that combo?")
                    }
                    completion(decoded.results)
                }
            } catch {
                print("JSON decode error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }.resume()
    }
}


