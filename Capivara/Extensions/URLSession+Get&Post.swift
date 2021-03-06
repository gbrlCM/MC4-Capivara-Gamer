//
//  URLSession+Get&Post.swift
//  Capivara
//
//  Created by Vitor Cheung on 14/12/21.
//

import Foundation

extension URLSession {
    func get<T:Codable>(urlString: String, decodeTo: T.Type) async throws -> T {
        guard let url = URL(string: urlString) // Mostra o caminho do back
        else {
            throw NSError(domain: "Unvalid URL", code: 1, userInfo: nil)
        }
        
        let yyyyMMdd: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            return formatter
          }()
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(yyyyMMdd)
        
        let request = URLRequest(url: url) // Cria uma requisição com o caminho do back
        let (data, _) = try await URLSession.shared.data(for: request) // Executa a requisição e conecta com o back
        let decodedData = try decoder.decode(T.self, from: data) // Decodifica o JSON para os tipos dentro do Swift
        
        return decodedData
        
    }
    
    func post<T:Encodable>(urlString: String, body: T) async throws {
        
        guard let url = URL(string: urlString) // Mostra o caminho do back
        else {
            throw NSError(domain: "Unvalid URL", code: 1, userInfo: nil)
        }
        let yyyyMMdd: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            return formatter
          }()
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(yyyyMMdd)
        var request = URLRequest(url: url)
        let bodyData = try encoder.encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else { return }
        if httpResponse.statusCode != 200 {
            throw NSError(domain: "Unvalid response", code: httpResponse.statusCode, userInfo: nil)
        }
        
    }
}
