//
//  AgreementServiceProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public protocol AgreementServiceProtocol {
    func getAgreement(request: AgreementRequest) async throws -> AgreementResponse?
}

public class AgreementService: AgreementServiceProtocol {
    public init() {}
    public func getAgreement(request: AgreementRequest) async throws -> AgreementResponse? {
        do {
            guard var urlComponents = URLComponents(string: request.route) else {
                return nil
            }
            var queryItems = urlComponents.queryItems ?? []
            queryItems.append(URLQueryItem(name: "name", value: request.name))
            urlComponents.queryItems = queryItems
            guard let url = urlComponents.url else {
                return nil
            }
            var req = URLRequest(url: url)
            req.allHTTPHeaderFields = request.headers
            req.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            let (data, res) = try await URLSession.shared.data(for: req)
            if (res as? HTTPURLResponse)?.statusCode == 204 {
                print("Agreement Response --> 204")
                return nil
            }
            if let response = try? JSONDecoder().decode(AgreementResponse.self, from: data) {
                print("Agreement Response --> 200")
                print(response)
                return response
            } else {
                print("Agreement Response --> Decode Error")
                return nil
            }
        } catch {
            print("Failed to Agreement Request \(error)")
            return nil
        }
    }
}
