//
//  HomeViewController.swift
//  ReARSearchShopping
//
//  Created by 副島拓哉 on 2021/04/03.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var ARButtonView: UIView!
    @IBOutlet weak var ARButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ARButtonSetting()
    }
    
    @IBAction func ARButtonAction(_ sender: Any) {
        let aRSearchViewController = self.storyboard?.instantiateViewController(withIdentifier: "ARSearchViewController") as! ARSearchViewController
        self.present(aRSearchViewController, animated: true, completion: nil)
    }
    
    func ARButtonSetting() {
        let gradationController = gradetionSetting()
            gradationController.gradation()
        ARButtonView.layer.insertSublayer(gradationController.gradientLayer, at:0)
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
