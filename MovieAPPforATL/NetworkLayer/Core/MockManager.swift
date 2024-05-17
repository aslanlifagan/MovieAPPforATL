//
//  MockManager.swift
//  MovieAPPforATL
//
//  Created by Aslanli Faqan on 17.05.24.
//

import Foundation

class MockManager {
    static func parseMockFile<T: Codable>(model: T.Type,
                                   path: String) -> (T?, String?) {
        guard let path = Bundle.main.url(forResource: path, withExtension: "json") else { return (nil, nil) }
        guard let data = try? Data(contentsOf: path) else { return (nil, nil) }
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return (model, nil)
        } catch {
            return (nil, error.localizedDescription)
        }
    }
}
