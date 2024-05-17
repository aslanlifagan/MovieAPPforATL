//
//  PeopleHelper.swift
//  MovieAPPforATL
//
//  Created by Aslanli Faqan on 17.05.24.
//

import Foundation
enum PeopleHelper: String {
    case popular = "person/popular?language=en-US&page="

    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}
