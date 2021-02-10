//
//  UIColor.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import UIKit

// MARK: - UIColor Extension
/// -  UIColor extension responsible for managing the project colors

extension UIColor {

	static var background: UIColor { UIColor(named: "Background") ?? .systemBackground }
	static var text: UIColor { UIColor(named: "Text") ?? .darkGray }
	static var bad: UIColor { UIColor(named: "Bad") ?? .systemRed }
	static var medium: UIColor { UIColor(named: "Medium") ?? .systemYellow }
	static var good: UIColor { UIColor(named: "Good") ?? .systemBlue }
	static var excellent: UIColor { UIColor(named: "Excellent") ?? .systemGreen }
}
