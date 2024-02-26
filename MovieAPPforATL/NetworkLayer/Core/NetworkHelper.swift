//
//  NetworkHelper.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case authError = "Auth Error"
    case generalError = "General"
    case unknownError = "Unknown Error"
    case invalidData = "Invalid Data"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "https://api.themoviedb.org/3/"
    let header = [
        "accept": "application/json",
         "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZmZjOTk4YmQwMDNlYmY4NjExNjE4NzQzODgxODYxNCIsInN1YiI6IjY1ZGIxZTAyOWI2ZTQ3MDE4NjAwYWI4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fzVDj8_nT9CH8dIMRHCSICGu-FnWbH08kvtYmY6m4ag"
    ]
    
    func requestURL(url: String) -> String {
        baseURL + url
    }
}
