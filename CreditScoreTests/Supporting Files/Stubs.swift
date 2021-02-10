//
//  Stubs.swift
//  CreditScoreTests
//
//  Created by Raul Brito on 10/02/21.
//

import Foundation
@testable import CreditScore

// MARK: - Stubs

class Stubs {

	let creditReportInfoBad = CreditReportInfo(score: 200, scoreBand: .bad)

	let creditReportInfoMedium = CreditReportInfo(score: 300, scoreBand: .medium)

	let creditReportInfoGood = CreditReportInfo(score: 500, scoreBand: .good)

	let creditReportInfoExcellent = CreditReportInfo(score: 700, scoreBand: .excellent)

	var creditReportBad: CreditReport {
		CreditReport(creditReportInfo: creditReportInfoBad)
	}

	var creditReportMedium: CreditReport {
		CreditReport(creditReportInfo: creditReportInfoMedium)
	}

	var creditReportGood: CreditReport {
		CreditReport(creditReportInfo: creditReportInfoGood)
	}

	var creditReportExcellent: CreditReport {
		CreditReport(creditReportInfo: creditReportInfoExcellent)
	}
}
