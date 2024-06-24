//
//  ResetPasswordView.swift
//  NavigatorAndViewModel
//
//  Created by Davidyoon on 6/24/24.
//

import SwiftUI

struct ResetPasswordView<Model>: View where Model: ResetPasswordViewModelProtocol {
    
    
    @StateObject var viewModel: Model
    @Binding var path: NavigationPath
    
    init(viewModel: Model, path: Binding<NavigationPath>) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._path = path
    }
    
    var body: some View {
        ScrollView {
            TextField("New password", text: $viewModel.password)
                .padding()
                .border(.gray)
                .padding()
            Button(action: {
                viewModel.requestUpdatePassword()
            }, label: {
                Text("Button")
                    .bold()
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundStyle(.black)
                    .background(.yellow)
            })
            .padding()
            
        }
        .navigationTitle("Reset Password View")
        .onChange(of: viewModel.isCompleted) { oldValue, newValue in
            if newValue {
                self.path = NavigationPath()
            }
        }
            
    }
}

#Preview {
    ResetPasswordView(viewModel: ResetPasswordViewModel(), path: .constant(NavigationPath()))
}
