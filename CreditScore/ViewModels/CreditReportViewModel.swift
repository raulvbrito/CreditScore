//
//  CreditReportViewModel.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

// MARK: - CreditReportViewModelProtocol

protocol CreditReportViewModelProtocol {
	var reloadData: (() -> Void)? { get set }
	var fetchFailed: (() -> Void)? { get set }

	func fetchReport()
	func creditReport() -> CreditReport
}

// MARK: - CreditReportViewModel

class CreditReportViewModel: CreditReportViewModelProtocol {

	// MARK: - Properties

	private let service: CreditReportServiceProtocol

	private var report: CreditReport! {
		didSet {
			self.reloadData?()
		}
	}

	var reloadData: (() -> Void)?

	var fetchFailed: (() -> Void)?

	// MARK: - Initialization

	init(_ service: CreditReportServiceProtocol = CreditReportService()) {
		self.service = service
	}

	// MARK: - Methods

	func fetchReport() {
		service.fetchReport { result in
			switch result {
			case .success(let creditReportInfo):
				self.report = CreditReport(creditReportInfo: creditReportInfo)
			case .failure(let error):
				self.fetchFailed?()

				print(error.localizedDescription)
			}
		}
	}

	func creditReport() -> CreditReport {
		return report
	}
}

// MARK: - CreditReport

struct CreditReport: Equatable {

	let score: Int
	let scoreBand: ScoreBand

	init(creditReportInfo: CreditReportInfo) {
		self.score = creditReportInfo.score
		self.scoreBand = creditReportInfo.scoreBand
	}
}
