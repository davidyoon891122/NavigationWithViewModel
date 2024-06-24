//
//  LoginViewModel.swift
//  NavigatorAndViewModel
//
//  Created by Davidyoon on 6/24/24.
//

import Foundation

protocol LoginViewModelProtocol: ObservableObject {
    
    var email: String { get set }
    var password: String { get set }
    var isLoginCompleted: Bool { get set }
    
    func requestLogin()
    
}

final class LoginViewModel {

    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isLoginCompleted: Bool = false
    
}

extension LoginViewModel: LoginViewModelProtocol {
    
    func requestLogin() {
        if !email.isEmpty && !password.isEmpty {
            self.isLoginCompleted = true
        }
    }
    
}
