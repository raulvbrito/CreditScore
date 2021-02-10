//
//  AppDelegate.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import UIKit

// MARK: - AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	var coordinator: MainCoordinator?

	// swiftlint:disable line_length
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		configureCoordinator()

		return true
	}

	private func configureCoordinator() {
		let navigationController = UINavigationController()

		coordinator = MainCoordinator(navigationController: navigationController)
		coordinator?.start()

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
}
