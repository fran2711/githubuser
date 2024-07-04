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
}
