//
//  CreditReportViewModelTests.swift
//  CreditScoreTests
//
//  Created by Raul Brito on 10/02/21.
//

import XCTest
@testable import CreditScore

// MARK: - CreditReportViewModelTests

class CreditReportViewModelTests: XCTestCase {

	var viewModelUnderTest: MockCreditReportViewModel!

	override func setUp() {
		super.setUp()

		viewModelUnderTest = MockCreditReportViewModel()
	}

	override func tearDown() {
		viewModelUnderTest = nil

		super.tearDown()
	}

	func testFetchReport() {
		viewModelUnderTest.report = Stubs().creditReportExcellent

		viewModelUnderTest.fetchReport()

		XCTAssertEqual(viewModelUnderTest.report, Stubs().creditReportExcellent)
	}

	func testBadScore() {
		let report = Stubs().creditReportBad

		viewModelUnderTest.report = report

		XCTAssertGreaterThanOrEqual(viewModelUnderTest.report.score, 0, "Invalid score")
		XCTAssertLessThanOrEqual(viewModelUnderTest.report.score, 200, "Score higher than expected")
		XCTAssertEqual(viewModelUnderTest.report.scoreBand.color, .bad, "Invalid color")
		XCTAssertEqual(viewModelUnderTest.report.scoreBand.description, "Bad", "Invalid description")
	}

	func testMediumScore() {
		let report = Stubs().creditReportMedium

		viewModelUnderTest.report = report

		XCTAssertGreaterThanOrEqual(viewModelUnderTest.report.score, 200, "Score lower than expected")
		XCTAssertLessThanOrEqual(viewModelUnderTest.report.score, 300, "Score higher than expected")
		XCTAssertEqual(viewModelUnderTest.report.scoreBand.color, .medium, "Invalid color")
		XCTAssertEqual(viewModelUnderTest.report.scoreBand.description, "Medium", "Invalid description")
	}

	func testGoodScore() {
		let report = Stubs().creditReportGood

		viewModelUnderTest.report = report

		XCTAssertGreaterThanOrEqual(viewModelUnderTest.report.score, 300, "Score lower than expected")
		XCTAssertLessThanOrEqual(viewModelUnderTest.report.score, 500, "Score higher than expected")
		XCTAssertEqual(viewModelUnderTest.report.scoreBand.color, .good, "Invalid color")
		XCTAssertEqual(viewModelUnderTest.report.scoreBand.description, "Good", "Invalid description")
	}

	func testExcellentScore() {
		let report = Stubs().creditReportExcellent

		viewModelUnderTest.report = report

		XCTAssertGreaterThanOrEqual(viewModelUnderTest.report.score, 500, "Score lower than expected")
		XCTAssertLessThanOrEqual(viewModelUnderTest.report.score, 700, "Invalid score")
		XCTAssertEqual(viewModelUnderTest.report.scoreBand.color, .excellent, "Invalid color")
		XCTAssertEqual(viewModelUnderTest.report.scoreBand.description, "Excellent", "Invalid description")
	}
}

// MARK: - MockCreditReportViewModel

class MockCreditReportViewModel: CreditReportViewModelProtocol {

	var report: CreditReport!

	var reloadData: (() -> Void)?

	var fetchFailed: (() -> Void)?

	func creditReport() -> CreditReport {
		return report
	}

	func fetchReport() {
		report = Stubs().creditReportExcellent
	}
}

