//
//  EmailValidator.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 02/12/21.
//

import Foundation

struct EmailValidator: Validator {
    func validate(text: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: text)
    }
}
