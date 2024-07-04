//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by Francisco Lucena on 23/4/24.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.startAnimating()
    }
}

struct LoadingView: View {
    
    let loading: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 200)
            
            ZStack {
                ActivityIndicatorView()
            }
            .padding(30)
            .background(Color.white)
            .cornerRadius(15)
        }.opacity(loading ? 1: 0)
    }
}

struct LoadingModifier: ViewModifier {
    
    let loading: Bool
        
    func body(content: Content) -> some View {
        ZStack {
            content
            LoadingView(loading: loading)
        }
    }
}

extension View {
    func loading(loading: Bool) -> some View {
        modifier(LoadingModifier(loading: loading))
    }
}
