//
//  GitHubUsersApp.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 3/7/24.
//

import SwiftUI

@main
struct GitHubUsersApp: App {
    var body: some Scene {
        WindowGroup {
            UsersList(viewModel: UserListViewModel())
        }
    }
}
