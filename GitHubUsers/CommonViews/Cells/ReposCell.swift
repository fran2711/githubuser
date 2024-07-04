//
//  ReposCell.swift
//  GitHubUsers
//
//  Created by Francisco Lucena on 4/7/24.
//

import SwiftUI

struct ReposCell: View {
    var name: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
                .foregroundStyle(.white)
            
            Text(description)
                .font(.caption)
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
            
            Divider()
                .background(Color.white)
                .frame(height: 2)
        }
    }
}

#Preview {
    ReposCell(name: "Android-Baccus",
              description: "A wine cellar multi platform app developed")
    .background(Color.blue)
}
