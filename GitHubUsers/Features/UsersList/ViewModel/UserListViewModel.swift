//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 4/7/24.
//

import Foundation
import SwiftUI
import DataPackage

@MainActor
class UserListViewModel: UserListVM {
    
    @Published var searchText: String = ""
    @Published var users: [User] = []
    
    @Published private (set) var loading: Bool = false
    @Published var alert: AlertUIModel? = nil
    
    var nextPage: Int = 1
    
    func handle(event: UserListEvent) {
        switch event {
        case .requestNextPage: self.requestNextPage()
        case .searchUser(let user): self.getUsers(user: user)
        }
    }
    
    func getUsers(user: String) {
        loading = true
        Task {
            defer { self.loading = false }
            do {
                guard let users = try await Repository.shared.fetchUsers(user: user, page: 1) else { return }
                self.users = users
                self.nextPage = 2
            } catch {
                Logger.log(.error, .repository, message: error.localizedDescription)
                self.alert = .init(error: error)
            }
        }
    }
    
    func requestNextPage() {
        loading = true
        Task {
            defer { self.loading = false }
            do {
                guard let users = try await Repository.shared.fetchUsers(user: searchText, page: nextPage) else { return }
                self.users.append(contentsOf: users)
                self.nextPage+=1
            } catch {
                self.alert = .init(error: error)
            }
        }
    }    
}
