//
//  CountryPickedViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/23/21.
//

import UIKit

class CountryPickedViewController: UIViewController {

    @IBOutlet weak var countryLabel: UITextField!
    
    @IBOutlet weak var countryFlag: UIImageView!
    
    @IBOutlet weak var countryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView()))
    }
    
    func didTapView() {
        let storyboard = UIStoryboard(name: "signup", bundle: nil)
        let countryListVC = storyboard.instantiateViewController(identifier: "CountryListVC")

                show(countryListVC, sender: self)

    }

    @IBAction func continueBtnDidPressed(_ sender: Any) {
        performSegue(withIdentifier: "toNumberPaymentVC", sender: self)
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
