//
//  Repository.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 4/7/24.
//

import Foundation
import DataPackage


public class Repository: ObservableObject {
    public static let shared = Repository()
    
    private var userDataSource: UserAPI = UserAPI()
    
    func fetchUsers(user: String?, page: Int) async throws -> [User]? {
        try await userDataSource.fetchUsers(user: user, page: page)
    }
    
    func fetchUserFollowersWithUrl(_ url: String) async throws -> [User]? {
        try await userDataSource.fetchUserFollowersWithUrl(url)
    }
    
    func fetchUserReposWithUrl(_ url: String) async throws -> [Repo]? {
        try await userDataSource.fetchUserReposWithUrl(url)
    }
}
