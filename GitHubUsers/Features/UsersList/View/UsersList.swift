//
//  UsersList.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 4/7/24.
//

import SwiftUI
import DataPackage

public enum UserListEvent {
    case requestNextPage
    case searchUser(user: String)
}

@MainActor
public protocol UserListVM: ObservableObject {
    var users: [User] { get }
    var searchText: String { get set }
    
    var loading: Bool { get }
    var alert: AlertUIModel? { get set }
        
    func handle(event: UserListEvent)
}

public struct UsersList<ViewModel: UserListVM>: View {
    
    @StateObject private var viewModel: ViewModel
    @State var searchText: String = ""
    
    private var searchResults: [User] {
        if viewModel.searchText.isEmpty {
            return []
        } else {
            return viewModel.users
        }
    }
    
    public init(viewModel: @autoclosure @escaping () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    public var body: some View {
        NavigationStack {
            List(searchResults) { user in
                NavigationLink {
                    UserDetailView(viewModel: UserDetailViewModel(user: user))
                } label: {
                    UserCell(imageUrl: user.avatarImageUrl,
                             name: user.userName)
                    .onAppear(perform: {
                        if user == viewModel.users.last {
                            viewModel.handle(event: .requestNextPage)
                        }
                    })
                }
                
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .onChange(of: searchText) { _, newValue in
                viewModel.searchText = searchText
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    viewModel.handle(event: .searchUser(user: newValue))
                }
            }
        }
        .navigationTitle("Github Users")
        .alert(model: $viewModel.alert)
        .loading(loading: viewModel.loading)
    }
}

#if DEBUG
class MockUserListVM: UserListVM {
    var searchText: String = "Fran27"
    
    var users: [User] = [User(id: 6410745,
                              userName: "Fran2711",
                              avatarUrl: "https://avatars.githubusercontent.com/u/6410745?v=4",
                              reposUrl: "https://api.github.com/users/fran2711/repos",
                              followersUrl: "https://api.github.com/users/fran2711/followers")]
    
    var loading: Bool = false
    
    var alert: AlertUIModel? = nil
    
    func handle(event: UserListEvent) {}
    
    
}

#Preview {
    UsersList(viewModel: MockUserListVM())
}
#endif
