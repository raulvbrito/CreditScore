//
//  Coordinator.swift
//  CreditScore
//
//  Created by Raul Brito on 10/02/21.
//

import UIKit

// MARK: - Coordinator

protocol Coordinator {
    var navigationController: UINavigationController { get set }

    func start()
}
