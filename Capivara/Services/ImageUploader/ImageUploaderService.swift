//
//  ImageUploaderService.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 14/12/21.
//

import Foundation
import UIKit

actor ImageUploaderService {
    
    private struct Payload: Codable {
        struct ImageData: Codable {
            let location: String
        }
        let data: ImageData
    }
    
    func upload(_ image: Data) async throws -> String {
        let request = URLRequest.multipartFormDataRequest(url: URL(string:  "https://capivara-image-uploader.herokuapp.com/upload")!, data: image, mimeType: "img/jpeg")

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode(Payload.self, from: data)
            return decodedData.data.location
        } catch {
            throw error
        }
    }
}

extension NSMutableData {
  func appendString(_ string: String) {
    if let data = string.data(using: .utf8) {
      self.append(data)
    }
  }
}

extension URLRequest {
    
    private static func convertFormField(named name: String, value: String, using boundary: String) -> String {
      var fieldString = "--\(boundary)\r\n"
      fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
      fieldString += "\r\n"
      fieldString += "\(value)\r\n"

      return fieldString
    }

    private static func convertFileData(fieldName: String, fileName: String, mimeType: String, fileData: Data, using boundary: String) -> Data {
      let data = NSMutableData()

      data.appendString("--\(boundary)\r\n")
      data.appendString("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n")
      data.appendString("Content-Type: \(mimeType)\r\n\r\n")
      data.append(fileData)
      data.appendString("\r\n")

      return data as Data
    }
    
    static func multipartFormDataRequest(url: URL, data: Data, mimeType: String) -> URLRequest {
        let boundary = "Boundary-\(UUID().uuidString)"

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let httpBody = NSMutableData()

        httpBody.append(convertFileData(fieldName: "photos", fileName: "image", mimeType: mimeType, fileData: data, using: boundary))

        httpBody.appendString("--\(boundary)--")

        request.httpBody = httpBody as Data
        return request
    }
}
