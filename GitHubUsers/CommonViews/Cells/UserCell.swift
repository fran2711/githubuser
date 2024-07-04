//
//  UserCell.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 4/7/24.
//

import SwiftUI

struct UserCell: View {
    var imageUrl: URL?
    var name: String
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 40)
            .background(Color.gray)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            
            Text(name)
                .font(.title2)
                .fontWeight(.black)
            
            Spacer()
            
        }
    }
}

#Preview {
    UserCell(imageUrl: URL(string: "https://avatars.githubusercontent.com/u/6410745?v=4"),
             name: "Fran2711")
}
