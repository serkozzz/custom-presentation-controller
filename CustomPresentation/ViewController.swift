//
//  File.swift
//  CustomPresentation
//
//  Created by Sergey Kozlov on 17.12.2024.
//

import UIKit

class ViewController: UIViewController {

    private let transition = MyTransition()

    @IBAction func button(_ sender: Any) {
        let vc = UIViewController()
        vc.view.backgroundColor = .brown
        vc.transitioningDelegate = transition
        vc.modalPresentationStyle = .custom

        present(vc, animated: true)
    }
}
