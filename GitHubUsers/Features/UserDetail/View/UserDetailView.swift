//
//  UserDetailView.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 4/7/24.
//

import SwiftUI
import DataPackage

public enum UserDetailEvent {
}

@MainActor
public protocol UserDetailVM: ObservableObject {
    var user: User { get }
    var repos: [Repo] { get }
    var followers: [User] { get }
    var loading: Bool { get }
    var alert: AlertUIModel? { get set }
    
    func handle(event: UserDetailEvent)
}

public struct UserDetailView<ViewModel: UserDetailVM>: View {
        
    @StateObject var viewModel: ViewModel
    
    public init(viewModel: @autoclosure @escaping () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    public var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                AsyncImage(url: viewModel.user.avatarImageUrl) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 150)
                .background(Color.gray)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                
                Text(viewModel.user.userName)
                    .font(.title2)
                    .fontWeight(.black)
            }
            .padding()
            
            if !viewModel.repos.isEmpty {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.repos) { repo in
                        ReposCell(name: repo.name,
                                  description: repo.description)
                        
                        if repo != viewModel.repos.last {
                            Divider()
                                .background(Color.white)
                                .frame(height: 2)
                        }
                    }
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(20)
                .padding()
            }
            
            if !viewModel.followers.isEmpty {
                VStack {
                    ForEach(viewModel.followers) { follower in
                        UserCell(imageUrl: follower.avatarImageUrl, name: follower.userName)
                        
                        if follower != viewModel.followers.last {
                            Divider()
                                .frame(height: 2)
                        }
                    }
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(20)
                .padding()
            }
          
        }
        .alert(model: $viewModel.alert)
        .loading(loading: viewModel.loading)
            
    }
}

#if DEBUG
class MockUserDetailVM: UserDetailVM {
    var user: User = User(id: 6410745,
                          userName: "Fran2711",
                          avatarUrl: "https://avatars.githubusercontent.com/u/6410745?v=4",
                          reposUrl: "https://api.github.com/users/fran2711/repos",
                          followersUrl: "https://api.github.com/users/fran2711/followers")
    
    var repos: [Repo] = [Repo(id: 75305035,
                              name: "Android-Baccus",
                              description: "A wine cellar multi platform app developed in Android that takes the data from a JSON developed in course of KeepCoding"),
                         Repo(id: 75304383, 
                              name: "Cards",
                              description: "Game of cards programmed in Swift"),
                         Repo(id: 81994062,
                              name: "CVCreator",
                              description: "Curriculum Vitae Creator with CoreData")]
    
    var followers: [User] = [User(id: 4069972,
                                  userName: "VagrantStory",
                                  avatarUrl: "https://avatars.githubusercontent.com/u/4069972?v=4",
                                  reposUrl: "https://api.github.com/users/VagrantStory/repos",
                                  followersUrl: "https://api.github.com/users/VagrantStory/followers"),
                             User(id: 4069972,
                                                           userName: "VagrantStory",
                                                           avatarUrl: "https://avatars.githubusercontent.com/u/4069972?v=4",
                                                           reposUrl: "https://api.github.com/users/VagrantStory/repos",
                                                           followersUrl: "https://api.github.com/users/VagrantStory/followers")]
        
    var alert: AlertUIModel? = nil
    var loading: Bool = false
    
    func handle(event: UserDetailEvent) { }
}

#Preview {
    UserDetailView.init(viewModel: MockUserDetailVM())
}
#endif
