//
//  ViewController.swift
//  ReARSearchShopping
//
//  Created by 副島拓哉 on 2021/04/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.present(homeViewController, animated: true, completion: nil)
        
    }


}

