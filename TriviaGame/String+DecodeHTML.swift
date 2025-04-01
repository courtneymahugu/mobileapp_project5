//
//  String+DecodeHTML.swift
//  TriviaGame
//
//  Created by Courtney Mahugu on 4/1/25.
//
import Foundation

extension String {
    var decodedHTML: String {
        guard let data = self.data(using: .utf8) else { return self }
        let attributed = try? NSAttributedString(data: data, options: [
            .documentType: NSAttributedString.DocumentType.html
        ], documentAttributes: nil)
        return attributed?.string ?? self
    }
}
