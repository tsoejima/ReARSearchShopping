//
//  ARFlipViewController.swift
//  ReARSearchShopping
//
//  Created by 副島拓哉 on 2021/04/07.
//

import UIKit

class ARFlipViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let aRFlipViewController = self.storyboard?.instantiateViewController(withIdentifier: "ARFlipViewController") as! ARFlipViewController
        self.present(aRFlipViewController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
