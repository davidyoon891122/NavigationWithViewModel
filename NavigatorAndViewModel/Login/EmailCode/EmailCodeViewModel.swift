//
//  EmailCodeViewModel.swift
//  NavigatorAndViewModel
//
//  Created by Davidyoon on 6/24/24.
//

import Foundation

protocol EmailCodeViewModelProtocol: ObservableObject {
    
    var emailCode: String { get set }
    var isValidated: Bool { get set }
    
    func requestCheckEmailCode()
    
}

final class EmailCodeViewModel: ObservableObject {
    
    @Published var emailCode: String = ""
    @Published var isValidated: Bool = false
    
}

extension EmailCodeViewModel: EmailCodeViewModelProtocol {
    
    func requestCheckEmailCode() {
        if !emailCode.isEmpty {
            self.isValidated = true
        }
    }
    
}
