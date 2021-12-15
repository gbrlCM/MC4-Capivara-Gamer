//
//  DELETARDEPOIS.swift
//  CapivaraWidgetExtension
//
//  Created by Gabriel Ferreira de Carvalho on 14/12/21.
//

import Foundation
import Security

protocol KeyChainServiceProtocol {
    func get(forKey key: String, inService service: String) throws -> String
    func set(_ value: String, forKey key: String, inService service: String) throws
    func delete(forKey key: String, inService service: String) throws
}

struct KeyChainService: KeyChainServiceProtocol {
    
    func get(forKey key: String, inService service: String) throws -> String {
        
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: key as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecAttrAccessGroup as String: "com.gbrlcm.capivaragamer" as AnyObject,
            kSecReturnData as String: kCFBooleanTrue
        ]
        
        var itemCopy: AnyObject?
        let status = SecItemCopyMatching(
            query as CFDictionary,
            &itemCopy
        )

        guard status != errSecItemNotFound else {
            throw KeychainError.itemNotFound
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }

        guard let value = itemCopy as? Data else {
            throw KeychainError.invalidItemFormat
        }
        
        guard let decodedValue = String(data: value, encoding: .utf8) else {
            throw KeychainError.invalidItemFormat
        }

        return decodedValue
    }
    
    func set(_ value: String, forKey key: String, inService service: String) throws {
        let data = value.data(using: .utf8)
        
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: key as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccessGroup as String: "com.gbrlcm.capivaragamer" as AnyObject,
            kSecValueData as String: data as AnyObject
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecDuplicateItem {
            try update(value, service: service, inKey: key)
            
        } else if status != errSecSuccess {
            print(status)
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
    private func update(_ value: String, service: String, inKey key: String) throws {
        let data = value.data(using: .utf8)
        
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: key as AnyObject,
            kSecAttrAccessGroup as String: "com.gbrlcm.capivaragamer" as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]

        let attributes: [String: AnyObject] = [
            kSecValueData as String: data as AnyObject
        ]

        let status = SecItemUpdate(
            query as CFDictionary,
            attributes as CFDictionary
        )

        guard status != errSecItemNotFound else {
            throw KeychainError.itemNotFound
        }

        // Any status other than errSecSuccess indicates the
        // update operation failed.
        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
    func delete(forKey key: String, inService service: String) throws {
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: key as AnyObject,
            kSecAttrAccessGroup as String: "com.gbrlcm.capivaragamer" as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess || status == errSecItemNotFound
        else {
            throw KeychainError.unexpectedStatus(status)
        }
        
    }
}

class KeychainServiceMock: KeyChainServiceProtocol {
    var values: [String : String] = [:]
    
    func get(forKey key: String, inService service: String) throws -> String {
        guard let value = values[key] else {
            throw KeychainError.itemNotFound
        }
        
        return value
    }
    
    func set(_ value: String, forKey key: String, inService service: String) throws {
        values[key] = value
    }
    
    func delete(forKey key: String, inService service: String) throws {
        values.removeValue(forKey: key)
    }
    
    
}

enum KeychainError: Error {
        // Attempted read for an item that does not exist.
        case itemNotFound
        
        // Attempted save to override an existing item.
        // Use update instead of save to update existing items
        case duplicateItem
        
        // A read of an item in any format other than Data
        case invalidItemFormat
        
        // Any operation result status than errSecSuccess
        case unexpectedStatus(OSStatus)
    }
