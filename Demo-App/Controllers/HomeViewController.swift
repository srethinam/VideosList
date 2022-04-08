//
//  ViewController.swift
//  Demo-App
//
//  Created by Saravanan Rethinam.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var seriesButton: UIButton!
    @IBOutlet weak var moviesButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func seriesButtonPressed(_ sender: Any) {
        let viewController = ListViewController()
        viewController.programType = .series
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func moviesButtonPressed(_ sender: Any) {
        let viewController = ListViewController()
        viewController.programType = .movie
        navigationController?.pushViewController(viewController, animated: true)
    }
}

