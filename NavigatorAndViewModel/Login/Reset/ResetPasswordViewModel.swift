//
//  ResetPasswordViewModel.swift
//  NavigatorAndViewModel
//
//  Created by Davidyoon on 6/24/24.
//

import Foundation

protocol ResetPasswordViewModelProtocol: ObservableObject {
    
    var password: String { get set }
    var isCompleted: Bool { get set }
    
    func requestUpdatePassword()
    
}

final class ResetPasswordViewModel {
    
    @Published var password: String = ""
    @Published var isCompleted: Bool = false
    
}

extension ResetPasswordViewModel: ResetPasswordViewModelProtocol {
    
    func requestUpdatePassword() {
        if !password.isEmpty {
            self.isCompleted = true
        }
    }
    
}
