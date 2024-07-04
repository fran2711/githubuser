//
//  Users.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 3/7/24.
//

import Foundation

public struct GitHubError: Decodable {
    public let message: String
}

public struct UserItems: Decodable {
    var items: [User]
}

public struct User: Decodable, Identifiable {
    public let id: Int
    public let userName: String
    public let avatarUrl: String
    public let reposUrl: String
    public let followersUrl: String
    
    public init(id: Int, userName: String, avatarUrl: String, reposUrl: String, followersUrl: String) {
        self.id = id
        self.userName = userName
        self.avatarUrl = avatarUrl
        self.reposUrl = reposUrl
        self.followersUrl = followersUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName = "login"
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
        case followersUrl = "followers_url"
    }
}

extension User {
    public var avatarImageUrl: URL? {
        URL(string: avatarUrl)
    }
}

extension User: Hashable {
    public func hash(into hasher: inout Hasher) {
          return hasher.combine(id)
      }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}

public struct Repo: Decodable, Identifiable {
    public let id: Int
    public let name: String
    public let description: String
    
    public init(id: Int, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
    }
}

extension Repo: Hashable {
    public func hash(into hasher: inout Hasher) {
          return hasher.combine(id)
      }
    
    public static func == (lhs: Repo, rhs: Repo) -> Bool {
        lhs.id == rhs.id
    }
}

/*{
 login: "fran2711",
 id: 6410745,
 node_id: "MDQ6VXNlcjY0MTA3NDU=",
 avatar_url: "https://avatars.githubusercontent.com/u/6410745?v=4",
 gravatar_id: "",
 url: "https://api.github.com/users/fran2711",
 html_url: "https://github.com/fran2711",
 followers_url: "https://api.github.com/users/fran2711/followers",
 following_url: "https://api.github.com/users/fran2711/following{/other_user}",
 gists_url: "https://api.github.com/users/fran2711/gists{/gist_id}",
 starred_url: "https://api.github.com/users/fran2711/starred{/owner}{/repo}",
 subscriptions_url: "https://api.github.com/users/fran2711/subscriptions",
 organizations_url: "https://api.github.com/users/fran2711/orgs",
 repos_url: "https://api.github.com/users/fran2711/repos",
 events_url: "https://api.github.com/users/fran2711/events{/privacy}",
 received_events_url: "https://api.github.com/users/fran2711/received_events",
 type: "User",
 site_admin: false,
 score: 1
 }
 */
