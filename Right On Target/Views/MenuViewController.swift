//
//  MenuViewController.swift
//  Right On Target
//
//  Created by Nikita Shyshkin on 16/10/2024.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true, completion: nil)
    }

}
