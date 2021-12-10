//
//  EmailValidator.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 02/12/21.
//

import Foundation

struct RegexValidator: Validator {
    let regex: Regex
    
    func validate(text: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", regex.rawValue).evaluate(with: text)
    }
}
