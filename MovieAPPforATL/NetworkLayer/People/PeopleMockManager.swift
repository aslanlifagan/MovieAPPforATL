//
//  PeopleMockManager.swift
//  MovieAPPforATL
//
//  Created by Aslanli Faqan on 17.05.24.
//

import Foundation

class PeopleMockManager {
    static let shared = PeopleMockManager()
    
    func getPeopleList() -> (PeopleModel?, String?) {
        let result = MockManager.parseMockFile(model: PeopleModel.self, path: "peopleMock")
        return (result.0, result.1)
    }
}
