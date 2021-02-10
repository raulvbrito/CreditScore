//
//  CreditScoreView.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import UIKit
import SnapKit

// MARK: - CreditScoreView

class CreditScoreView: UIView {

    // MARK: - UI Elements

    lazy var contentView: UIView = {
		let contentView = UIView()
		contentView.backgroundColor = .background
		contentView.layer.borderWidth = 2
		contentView.layer.borderColor = UIColor.text.cgColor
		contentView.layer.cornerRadius = 150

		addSubview(contentView)
		sendSubviewToBack(contentView)

		return contentView
	}()

	lazy var titleLabel: UILabel = {
		let titleLabel = UILabel()
		titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
		titleLabel.text = "Your credit score is"
		titleLabel.textColor = .text
		titleLabel.textAlignment = .center

		contentView.addSubview(titleLabel)

		return titleLabel
	}()

	lazy var scoreCountLabel: UILabel = {
		let scoreCountLabel = UILabel()
		scoreCountLabel.font = .systemFont(ofSize: 64, weight: .thin)
		scoreCountLabel.text = "---"
		scoreCountLabel.textColor = .text
		scoreCountLabel.textAlignment = .center
		scoreCountLabel.accessibilityLabel = "scoreCountLabel"
		scoreCountLabel.isAccessibilityElement = true

		contentView.addSubview(scoreCountLabel)

		return scoreCountLabel
	}()

	lazy var subtitleLabel: UILabel = {
		let subtitleLabel = UILabel()
		subtitleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
		subtitleLabel.text = "out of 700"
		subtitleLabel.textColor = .text
		subtitleLabel.textAlignment = .center

		contentView.addSubview(subtitleLabel)

		return subtitleLabel
	}()

	lazy var scoreDescriptionLabel: UILabel = {
		let scoreDescriptionLabel = UILabel()
		scoreDescriptionLabel.font = .systemFont(ofSize: 24, weight: .medium)
		scoreDescriptionLabel.textAlignment = .center
		scoreDescriptionLabel.accessibilityLabel = "scoreDescriptionLabel"
		scoreDescriptionLabel.isAccessibilityElement = true

		contentView.addSubview(scoreDescriptionLabel)

		return scoreDescriptionLabel
	}()

	// MARK: - Initialization

	init() {
		super.init(frame: .zero)

		configureLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Layout

	private func configureLayout() {
		contentView.snp.makeConstraints { make in
			make.top.leading.equalToSuperview()
			make.center.equalToSuperview()
		}

		titleLabel.snp.makeConstraints { make in
			make.bottom.equalTo(scoreCountLabel.snp.top).inset(-8)
			make.leading.equalToSuperview().offset(16)
			make.centerX.equalToSuperview()
		}

		scoreCountLabel.snp.makeConstraints { make in
			make.leading.equalToSuperview().offset(32)
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview().offset(-16)
		}

		subtitleLabel.snp.makeConstraints { make in
			make.top.equalTo(scoreCountLabel.snp.bottom).offset(8)
			make.leading.equalTo(titleLabel.snp.leading)
			make.centerX.equalToSuperview()
		}

		scoreDescriptionLabel.snp.makeConstraints { make in
			make.top.equalTo(subtitleLabel.snp.bottom).offset(8)
			make.leading.equalTo(subtitleLabel.snp.leading)
			make.centerX.equalToSuperview()
		}
	}

	// MARK: - Methods

	func configureContent(from creditReport: CreditReport) {
		scoreCountLabel.text = String(creditReport.score)
		scoreCountLabel.accessibilityValue = String(creditReport.score)
		scoreCountLabel.textColor = creditReport.scoreBand.color

		scoreDescriptionLabel.text = creditReport.scoreBand.description
		scoreDescriptionLabel.accessibilityValue = creditReport.scoreBand.description
		scoreDescriptionLabel.textColor = creditReport.scoreBand.color
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
	   if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
		   contentView.layer.borderColor = UIColor.text.cgColor
	   }
	}
}
