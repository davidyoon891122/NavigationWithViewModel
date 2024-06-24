//
//  EmailCodeView.swift
//  NavigatorAndViewModel
//
//  Created by Davidyoon on 6/24/24.
//

import SwiftUI

struct EmailCodeView<Model>: View where Model: EmailCodeViewModelProtocol {
    
    @StateObject var viewModel: Model
    
    @Binding var path: NavigationPath
    
    init(viewModel: Model, path: Binding<NavigationPath>) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._path = path
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Email Code", text: $viewModel.emailCode)
                    .padding()
                    .border(.gray)
                    .padding()
                Button(action: {
                    viewModel.requestCheckEmailCode()
                }, label: {
                    Text("Button")
                        .bold()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundStyle(.black)
                        .background(.yellow)
                })
                .padding()
            }
        }
        .navigationDestination(isPresented: $viewModel.isValidated) {
            ResetPasswordView(viewModel: ResetPasswordViewModel(), path: $path)
        }
    }
}

#Preview {
    EmailCodeView(viewModel: EmailCodeViewModel(), path: .constant(NavigationPath()))
}
