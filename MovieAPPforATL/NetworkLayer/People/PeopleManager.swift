//
//  PeopleManager.swift
//  MovieAPPforATL
//
//  Created by Aslanli Faqan on 17.05.24.
//

import Foundation

class PeopleManager {
    static let shared = PeopleManager()
    
    func getPeopleListt(pageID: Int, complete: @escaping((PeopleModel?, String?) -> Void)) {
        let url = "\(PeopleHelper.popular.path)\(pageID)"
        NetworkManager.shared.request(
            type: PeopleModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
}
