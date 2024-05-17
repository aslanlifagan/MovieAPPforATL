//
//  PeopleMockManager.swift
//  MovieAPPforATL
//
//  Created by Aslanli Faqan on 17.05.24.
//

import Foundation

class PeopleMockManager {
    static let shared = PeopleMockManager()
    
    func getPeopleList(complete: @escaping((PeopleModel?, String?) -> Void)) {
        let result = MockManager.parseMockFile(model: PeopleModel.self, path: "peopleMock")
        complete(result.0, result.1)
    }
}
