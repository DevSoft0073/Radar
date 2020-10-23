//
//  ForgotPasswordVC.swift
//  Radar
//
//  Created by Vivek Dharmani on 22/10/20.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func submitButtonAction(_ sender: Any) {
        let vc = HomeVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
