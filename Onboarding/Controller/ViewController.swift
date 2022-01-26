//
//  ViewController.swift
//  Onboarding
//
//  Created by Ezequiel Ignacio Aliotta on 18/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK - Outlet
    
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeButton()
    }

    func customizeButton() {
        continueButton.layer.cornerRadius = 6
    }

    // MARK - Actions
    
    
    @IBAction func continueButton(_ sender: UIButton) {
        let debtsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DebtsViewController")
        navigationController?.pushViewController(debtsViewController, animated: true)
    }
    
    
}

