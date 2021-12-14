//
//  GameRepository.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 09/12/21.
//

import Foundation

struct GameRepository: GameRepositoryProtocol {
    
    func fetchAllGames() async throws -> [Game] {
        guard let url = URL(string: "https://capivara-back.herokuapp.com/game") // Mostra o caminho do back
        else {
            throw NSError(domain: "Unvalid URL", code: 1, userInfo: nil)
        }
        
        let request = URLRequest(url: url) // Cria uma requisição com o caminho do back
        let (data, _) = try await URLSession.shared.data(for: request) // Executa a requisição e conecta com o back
        let decodedData = try JSONDecoder().decode([Game].self, from: data) // Decodifica o JSON para os tipos dentro do Swift
        
        return decodedData // Retorna os dados
    }
}
