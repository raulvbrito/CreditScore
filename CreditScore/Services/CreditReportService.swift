//
//  CreditReportService.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import Foundation

// MARK: - CreditReportServiceProtocol

protocol CreditReportServiceProtocol {
	func fetchReport(completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void)
}

// MARK: - CreditReportService

class CreditReportService: CreditReportServiceProtocol {

	// MARK: - URLs

	private let baseUrl = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com"

	// MARK: - fetchReport
	/// Fetch report from remote URL
	/// @completion Result type that returns either a parsed Report or an error

	func fetchReport(completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void) {
		guard let url = URL(string: "\(baseUrl)/prod/mockcredit/values") else { return }

		let task = URLSession.shared.dataTask(with: url) {(data, _, error) in
			guard let data = data, error == nil else {
				completion(.failure(.requestFailed))
				return
			}

			do {
				let report = try JSONDecoder().decode(Report.self, from: data)

				completion(.success(report.creditReportInfo))
			} catch let error {
				completion(.failure(error as? NetworkError ?? .failedToDecode))
			}
		}

		task.resume()
	}
}
