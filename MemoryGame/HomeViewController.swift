//
//  HomeViewController.swift
//  MemoryGame
//
//  Created by Gabriel Rosa on 14/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class HomeViewController: ViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameSegueIdentifier" {
            if let controller = segue.destination as? ViewController {
                if let name = nameTextField.text {
                    controller.userName = name
                }                
            }
        }
    }
}
