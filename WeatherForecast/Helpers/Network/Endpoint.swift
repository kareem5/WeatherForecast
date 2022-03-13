//
//  Endpoint.swift
//  WeatherForecast
//
//  Created by Kareem Ahmed on 13/03/2022.
//

import Foundation

protocol Endpoint {
    
    /// The target's base `URL`.
    var baseURL: URL { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: HTTPRequestMethod { get }
    
    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}

enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}
