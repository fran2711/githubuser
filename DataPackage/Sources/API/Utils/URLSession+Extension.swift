//
//  URLSession+Extension.swift
//  RickAndMorty
//
//  Created by Francisco Lucena on 23/4/24.
//

import Foundation

extension URLSession {
    func data(with request: URLRequest) async throws -> (Data?, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            #if DEBUG
            print(request.curl(pretty: true))
            #endif
            let task = self.dataTask(with: request) { data, response, error in
                #if DEBUG
                (response as? HTTPURLResponse)?.log(data: data, error: error)
                #endif
                guard let response = response, let data else {
                    if let error = error as? URLError {
                        Logger.log(.error, .repository, message: error.localizedDescription)
                        return continuation.resume(throwing: error)
                    }
                    let error = error ?? URLError(.badServerResponse)
                    Logger.log(.error, .repository, message: error.localizedDescription)
                    return continuation.resume(throwing: error)
                }
                guard let httpResponse = response as? HTTPURLResponse, let statusCode = httpResponse.status else {
                    let error = error ?? URLError(.badServerResponse)
                    Logger.log(.error, .repository, message: error.localizedDescription)
                    return continuation.resume(throwing: error)
                }
                
                if let gitHubError = try? data.decodedResponse(GitHubError.self) {
                    Logger.log(.error, .repository, message: error?.localizedDescription ?? "")
                    return continuation.resume(throwing: APIError.server(code: statusCode, data: data, error: nil))
                }
                if let error = error as? URLError {
                    Logger.log(.error, .repository, message: error.localizedDescription)
                    return continuation.resume(throwing: error)
                }
                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}
