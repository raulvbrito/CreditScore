//
//  CreditScoreUITests.swift
//  CreditScoreUITests
//
//  Created by Raul Brito on 10/02/21.
//

import XCTest

// MARK: - CreditScoreUITests

class CreditScoreUITests: XCTestCase {

	var app: XCUIApplication!

	override func setUp() {
		continueAfterFailure = false

		app = XCUIApplication()
	}

	// MARK: - UI Tests

	func testApp() throws {
		app.launch()

		let scoreCountLabel = app.staticTexts["scoreCountLabel"]

		let fetched = scoreCountLabel.waitForExistence(timeout: 10)

		if fetched {
			let scoreDescriptionLabel = app.staticTexts["scoreDescriptionLabel"]

			if let scoreCountText = scoreCountLabel.value as? String,
			   let description = scoreDescriptionLabel.value as? String,
			   let score = Int(scoreCountText) {
				switch score {
				case 0...200:
					XCTAssertEqual(description, "Bad", "Wrong description")
				case 200...300:
					XCTAssertEqual(description, "Medium", "Wrong description")
				case 300...500:
					XCTAssertEqual(description, "Good", "Wrong description")
				case 500...700:
					XCTAssertEqual(description, "Excellent", "Wrong description")
				default:
					XCTAssert(false, "Invalid description")
				}
			}
		}
	}
}
