//
//  UINavigationController+StatusBar.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import UIKit

// MARK: - UINavigationController Extension
/// -  UINavigationController extension responsible for changing the status bar style

extension UINavigationController {

	open override var preferredStatusBarStyle: UIStatusBarStyle {
		.lightContent
	}
}
