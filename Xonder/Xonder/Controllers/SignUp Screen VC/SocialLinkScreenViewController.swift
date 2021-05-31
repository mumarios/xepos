//
//  SocialLinkScreenViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit

class SocialLinkScreenViewController: UIViewController {

    @IBOutlet weak var urlTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func urlValidation(url:String) -> Bool {
        let emailRegex = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let trimmedString = url.trimmingCharacters(in: .whitespaces)
        let validateUrl = NSPredicate(format: "self Matches %@", emailRegex)
        let isValidateUrl = validateUrl.evaluate(with: trimmedString)
        return isValidateUrl
    }
    
    @IBAction func continueBtnDidPressed(_ sender: Any) {
        if urlValidation(url: urlTxtField.text!) == false {
            let alertPopup = UIAlertController(title: "Invalid Url Address", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            
            performSegue(withIdentifier: "toSelectCustomerVC", sender: self)
        }

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
