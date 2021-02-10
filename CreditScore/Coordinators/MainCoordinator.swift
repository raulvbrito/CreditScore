//
//  MainCoordinator.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import UIKit

// MARK: - MainCoordinator

class MainCoordinator: Coordinator {

	var navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	// MARK: - ScoreViewController

	func start() {
		let viewController = CreditReportViewController(viewModel: CreditReportViewModel(CreditReportService()))
		viewController.coordinator = self

		navigationController.pushViewController(viewController, animated: false)
	}
}
