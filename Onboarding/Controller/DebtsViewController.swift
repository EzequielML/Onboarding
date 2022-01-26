//
//  DebtsViewController.swift
//  Onboarding
//
//  Created by Ezequiel Ignacio Aliotta on 25/01/2022.
//

import UIKit

class DebtsViewController: UIViewController, UITableViewDataSource {
    
    //MARK - Outlet
    
    @IBOutlet weak var debtsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBarButton()

        debtsTableView.dataSource = self
        debtsTableView.delegate = self
        debtsTableView.register(UINib(nibName: "DebtsTableViewCell", bundle: nil), forCellReuseIdentifier: "DebtsTableViewCell")
        
    }
    
    //MARK - Class methods
    
    func configureNavigationBarButton() {
        
        self.title = "Debitos Automaticos"
        let faqButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(faq))
                
        // let faqButton = UIBarButtonItem(image: UIImage(named: "claro"), style: .done, target: self, action: #selector(faq))
                
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.init(hex: "0096E3")

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.rightBarButtonItems = [faqButton]
        navigationController?.navigationBar.tintColor = UIColor.white
        
//        navigationController?.navigationBar.barTintColor = .clear
//                navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    @objc func faq() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "DebtsTableViewCell", for: indexPath)
        
        return celula
    }
    
    // MARK - Actions
    
    
    @IBAction func debtsTableViewButton(_ sender: UIButton) {
        let addDebtsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddDebtsViewController")
        
        navigationController?.pushViewController(addDebtsViewController, animated: true)
    }
    
}

extension DebtsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}


internal extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }

    /// init UIColor with hex code
    /// - Parameter hex: color representation, e.g: "#FFFFFF" or with alpha "#FF000000"
    convenience init?(hex: String) {
        var cString: String = hex.uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        var rgbValue: UInt64 = 0
        guard (cString.count == 6 || cString.count == 8) &&
            Scanner(string: cString).scanHexInt64(&rgbValue) else {
            return nil
        }
        if cString.count == 6 {
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        } else {
            self.init(
                red: CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x000000FF) / 255.0,
                alpha: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            )
        }
    }
}
