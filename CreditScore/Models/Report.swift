//
//  Report.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import Foundation
import UIKit

// MARK: - Report

struct Report: Codable, Equatable {

	let creditReportInfo: CreditReportInfo
}

// MARK: - CreditReportInfo

struct CreditReportInfo: Codable, Equatable {

	let score: Int
	let scoreBand: ScoreBand
}

// MARK: - ScoreBand

enum ScoreBand: Int, Codable {

	case bad = 1
	case medium = 2
	case good = 3
	case excellent = 4

	var color: UIColor {
		switch self {
		case .bad: return .bad
		case .medium: return .medium
		case .good: return .good
		case .excellent: return .excellent
		}
	}

	var description: String {
		switch self {
		case .bad: return "Bad"
		case .medium: return "Medium"
		case .good: return "Good"
		case .excellent: return "Excellent"
		}
	}
}
