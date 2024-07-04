//
//  Users.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 3/7/24.
//

import Foundation

struct UserItems: Decodable {
    var items: [User]
}

struct User: Decodable {
    let userName: String
    let avatarUrl: String
    let reposUrl: String
    let followersUrl: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "login"
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
        case followersUrl = "followers_url"
    }
}

struct Repo: Decodable {
    let name: String
    let description: String
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
