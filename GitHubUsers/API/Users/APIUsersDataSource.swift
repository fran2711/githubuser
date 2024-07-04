//
//  APIUsersDataSource.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 3/7/24.
//

import Foundation

protocol APIUsersDataSource {
    func fetchUsers(user: String?, page: String) async throws -> [User]?
    func fetchUserFollowersWithUrl(_ url: String) async throws -> [User]?
    func fetchUserReposWithUrl(_ url: String) async throws -> [Repo]?
}

struct UserAPI: APIUsersDataSource {
    
    func userUrl(_ user: String?, page: Int) -> String? {
        guard let user, !user.isEmpty else { return nil }
        return "https://api.github.com/search/users?q=\(user)&page=\(page)"
    }
    
    func fetchUsers(user: String?, page: String) async throws -> [User]? {
        []
    }
    
    func fetchUsers(user: String?, page: Int) async throws -> (users: [User], nextPage: Int?) {
        let emptyResult: (users: [User], nextPage: Int?) = ([], nil)
        guard let url = self.userUrl(user, page: page) else {
            return emptyResult
        }
        
        let response = try await API.data(url: url, method: .get)
        guard let userItems = try response?.decodedResponse(UserItems.self) else {
            return emptyResult
        }
        let nextPage = userItems.items.isEmpty ? nil : page + 1
        return (users: userItems.items, nextPage: nextPage)
    }
    
    func fetchUserFollowersWithUrl(_ url: String) async throws -> [User]? {
        let response = try await API.data(url: url, method: .get)
        return try response?.decodedResponse([User].self)
    }
    
    func fetchUserReposWithUrl(_ url: String) async throws -> [Repo]? {
        let response = try await API.data(url: url, method: .get)
        return try response?.decodedResponse([Repo].self)
    }
    
    
    
}
