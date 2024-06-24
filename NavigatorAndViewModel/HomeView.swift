//
//  HomeView.swift
//  NavigatorAndViewModel
//
//  Created by Davidyoon on 6/24/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollView{
                Text("Home View")
                
                NavigationLink(value: "LoginView") {
                    Text("LogIn")
                }
            }
            .navigationDestination(for: String.self) { _ in
                LoginView(viewModel: LoginViewModel(), path: $navigationPath)
            }
        }
        
        
    }
}

#Preview {
    HomeView()
}
