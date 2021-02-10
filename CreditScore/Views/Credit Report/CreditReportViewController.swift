//
//  CreditReportViewController.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import UIKit
import SnapKit

// MARK: - CreditReportViewController

class CreditReportViewController: UIViewController {

	// MARK: - Properties

	private var viewModel: CreditReportViewModelProtocol

	weak var coordinator: MainCoordinator?

	// MARK: - UI Elements

	lazy var creditScoreView: CreditScoreView = {
		let creditScoreView = CreditScoreView()
		creditScoreView.alpha = 0

		view.addSubview(creditScoreView)

		return creditScoreView
	}()

	lazy var fetchFailedLabel: UILabel = {
		let fetchFailedLabel = UILabel()
		fetchFailedLabel.alpha = 0
		fetchFailedLabel.numberOfLines = 0
		fetchFailedLabel.textColor = .darkGray
		fetchFailedLabel.textAlignment = .center
		fetchFailedLabel.text = "Failed to fetch credit score"

		view.addSubview(fetchFailedLabel)

		return fetchFailedLabel
	}()

	// MARK: - Initialization

	init(viewModel: CreditReportViewModelProtocol) {
		self.viewModel = viewModel

		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Layout

	override func loadView() {
		super.loadView()

		configureLayout()
	}

	private func configureLayout() {
		creditScoreView.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview().offset(-32)
			make.width.height.equalTo(300)
		}

		fetchFailedLabel.snp.makeConstraints { make in
			make.leading.equalToSuperview().offset(32)
			make.center.equalToSuperview()
		}
	}

	// MARK: - ViewController Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .background

		configureNavigationBar()

		configureReachability()

		configureCreditScore()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		setNeedsStatusBarAppearanceUpdate()
	}

	// MARK: - Methods

	private func configureNavigationBar() {
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.barTintColor = .black
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

		navigationItem.title = "Dashboard"
	}

	private func configureReachability() {
		let network = NetworkManager.shared

		network.reachability.whenReachable = { _ in
			self.viewModel.fetchReport()
        }
	}

	private func configureCreditScore() {
		viewModel.reloadData = { [weak self] in
			DispatchQueue.main.async {
				if let creditReport = self?.viewModel.creditReport() {
					self?.creditScoreView.configureContent(from: creditReport)
				}

				UIView.animate(withDuration: 0.3) {
					self?.creditScoreView.alpha = 1
					self?.fetchFailedLabel.alpha = 0
				}
			}
		}

		viewModel.fetchFailed = { [weak self] in
			DispatchQueue.main.async {
				UIView.animate(withDuration: 0.3) {
					self?.creditScoreView.alpha = 0
					self?.fetchFailedLabel.alpha = 1
				}
			}
		}

		viewModel.fetchReport()
	}
}
