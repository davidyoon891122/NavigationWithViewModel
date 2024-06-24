//
//  LoginView.swift
//  NavigatorAndViewModel
//
//  Created by Davidyoon on 6/24/24.
//

import SwiftUI

struct LoginView<Model>: View where Model: LoginViewModelProtocol {
    
    @StateObject var viewModel: Model
    
    @Binding var path: NavigationPath
    
    init(viewModel: Model, path: Binding<NavigationPath>) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._path = path
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("LoginView")
                VStack {
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .border(.gray)
                    TextField("Password", text: $viewModel.password)
                        .padding()
                        .border(.gray)
                }
                .padding()
                Button(action: {
                    viewModel.requestLogin()
                }, label: {
                    Text("Button")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(.yellow)
                        .foregroundColor(.black)
                })
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    self.path.removeLast()
                }, label: {
                    Text("Back To Root")
                })
            }
        }
        .navigationDestination(isPresented: $viewModel.isLoginCompleted) {
            EmailCodeView(viewModel: EmailCodeViewModel(), path: $path)
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(), path: .constant(NavigationPath()))
}
