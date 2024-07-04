//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 4/7/24.
//

import Foundation
import SwiftUI
import DataPackage

enum UserListNavigation {
    case userSelected(user: User)
}

protocol UserListNavigator {
    func navigate(to navigation: UserListNavigation)
}

@MainActor
class UserListViewModel: UserListVM {
    @Published var searchText: String = ""
    @Published var users: [User] = []
    
    @Published private (set) var loading: Bool = false
    @Published var alert: AlertUIModel? = nil
    
    private let navigator: UserListNavigator
    var page: Int = 1

    init(navigator: UserListNavigator) {
        self.navigator = navigator
    }
    
    func handle(event: UserListEvent) {
        switch event {
        case .userSelected(let user): navigator.navigate(to: .userSelected(user: user))
        case .requestNextPage: break
        }
    }
    
    
    func getUsers() {
        loading = true
        Task {
            defer { self.loading = false }
            
//            do {
//                let response = try await
//            }
        }
    }
}
