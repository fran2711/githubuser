//
//  APIUsersDataSource.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 3/7/24.
//

import Foundation

public protocol APIUsersDataSource {
    func fetchUsers(user: String?, page: Int) async throws -> [User]?
    func fetchUserFollowersWithUrl(_ url: String) async throws -> [User]?
    func fetchUserReposWithUrl(_ url: String) async throws -> [Repo]?
}

public struct UserAPI: APIUsersDataSource {
    
    public init() {}
    
    private func userUrl(_ user: String?, page: Int) -> String? {
        guard let user, !user.isEmpty else { return nil }
        return "https://api.github.com/search/users?q=\(user)&page=\(page)"
    }

    public func fetchUsers(user: String?, page: Int) async throws -> [User]? {
        guard let url = self.userUrl(user, page: page) else {  return nil }
        let response = try await API.data(url: url, method: .get)
        let userItems = try response?.decodedResponse(UserItems.self)
        return userItems?.items
    }
    
    public func fetchUserFollowersWithUrl(_ url: String) async throws -> [User]? {
        let response = try await API.data(url: url, method: .get)
        return try response?.decodedResponse([User].self)
    }
    
    public func fetchUserReposWithUrl(_ url: String) async throws -> [Repo]? {
        let response = try await API.data(url: url, method: .get)
        return try response?.decodedResponse([Repo].self)
    }
    
    
    
}
