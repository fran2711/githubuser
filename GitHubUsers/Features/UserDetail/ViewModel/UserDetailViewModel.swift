//
//  UserDetailViewModel.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 4/7/24.
//

import Foundation
import SwiftUI
import DataPackage

@MainActor
class UserDetailViewModel: UserDetailVM {
    
    @Published private (set) var followersLoading: Bool = false
    @Published private (set) var reposLoading: Bool = false
    @Published var alert: AlertUIModel? = nil
     
    @Published var repos: [Repo] = []
    @Published var followers: [User] = []
    let user: User
    
    init(user: User) {
        self.user = user
        fetchUserData()
    }

    func handle(event: UserDetailEvent) {}
    
    func fetchUserData() {
        followersLoading = true
        reposLoading = true
        Task {
            defer {
                self.followersLoading = false
                self.reposLoading = false
            }
            do {
                let userData: () =  try await fetchUserRepos()
                let userFollowers: () = try await fetchUserFollowers()
                let _ = (userData, userFollowers)
            } catch {
                self.alert = .init(error: error)
            }
        }
    }
    
    func fetchUserRepos() async throws {
        guard let repos = try await Repository.shared.fetchUserReposWithUrl(user.reposUrl) else { return }
        self.repos = repos
        reposLoading = false
    }
    
    func fetchUserFollowers() async throws {
        guard let followers = try await Repository.shared.fetchUserFollowersWithUrl(user.followersUrl) else { return }
        self.followers = followers
        followersLoading = false
    }
}
