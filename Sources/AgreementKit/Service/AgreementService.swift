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
            guard let url = URL(string: request.route) else {
                return AgreementResponse()
            }
            var req = URLRequest(url: url)
            req.allHTTPHeaderFields = request.dictionary
            req.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            let (data, res) = try await URLSession.shared.data(for: req)
            if (res as? HTTPURLResponse)?.statusCode == 204 {
                return nil
            }
            if let AgreementResponse = try? JSONDecoder().decode(AgreementResponse.self, from: data) {
                print(AgreementResponse)
                return AgreementResponse
            } else {
                print("Invalid Response")
                return nil
            }
        } catch {
            print("Failed to Send POST Request \(error)")
            return nil
        }
    }
}
