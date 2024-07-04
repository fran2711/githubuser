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
    
    @Published private (set) var loading: Bool = false
    @Published var alert: AlertUIModel? = nil
     
    var repos: [Repo] = []
    var followers: [User] = []
    let user: User
    
    init(user: User) {
        self.user = user
    }

    func handle(event: UserDetailEvent) {}
    
}
