//
//  File.swift
//  
//
//  Created by Francisco Lucena on 4/7/24.
//

import Foundation

public enum APIError: Error {
    case url(error: URLError)
    case server(code: HTTPStatusCode, data: Data?, error: GitHubError?)
    case `internal`(Error?)
}
