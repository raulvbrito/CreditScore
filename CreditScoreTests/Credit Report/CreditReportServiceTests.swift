//
//  CreditReportServiceTests.swift
//  CreditScoreTests
//
//  Created by Raul Brito on 10/02/21.
//

import XCTest
@testable import CreditScore

// MARK: - CreditReportServiceTests

class CreditReportServiceTests: XCTestCase {

	var serviceUnderTest: MockCreditReportService!

	override func setUp() {
		super.setUp()

		serviceUnderTest = MockCreditReportService()
	}

	override func tearDown() {
		serviceUnderTest = nil

		super.tearDown()
	}

	func testFetchReport() {
		serviceUnderTest.report = Stubs().creditReportInfoBad

		serviceUnderTest.fetchReport { _ in }

		XCTAssert(serviceUnderTest.fetchCreditReportCalled)
	}
}

// MARK: - MockCreditReportService

class MockCreditReportService: CreditReportServiceProtocol {

	var fetchCreditReportCalled = false

	var report: CreditReportInfo!

    var completion: ((Result<CreditReportInfo, NetworkError>) -> Void)!

	func fetchReport(completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void) {
		fetchCreditReportCalled = true

		self.completion = completion
	}

    func fetchSuccess() {
        completion(.success(report))
    }

    func fetchFail(error: NetworkError?) {
		completion(.failure(error ?? .failedToDecode))
    }
}
