//
//  NetworkManager.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import Foundation
import Reachability

// MARK: - NetworkManager

class NetworkManager: NSObject {

	// MARK: - Properties

	var reachability: Reachability!

	static let shared: NetworkManager = {
		return NetworkManager()
	}()

	// MARK: - Initialization

	override init() {
		super.init()

		do {
			reachability = try Reachability()

			try reachability.startNotifier()
		} catch {
			print("Failed to start reachability notifier")
		}
	}
}
