//
//  DigitCodeViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit
import SVPinView

class DigitCodeViewController: UIViewController {

    @IBOutlet weak var pinCodeView: SVPinView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pinCodeView.pinLength = 4
        pinCodeView.secureCharacter = "\u{25CF}"
        pinCodeView.interSpace = 4
        pinCodeView.textColor = UIColor.black
        pinCodeView.shouldSecureText = true
        pinCodeView.style = .box

        pinCodeView.borderLineColor = UIColor.black
        pinCodeView.activeBorderLineColor = UIColor.lightGray
        pinCodeView.borderLineThickness = 1
        pinCodeView.activeBorderLineThickness = 3

        pinCodeView.font = UIFont.systemFont(ofSize: 15)
        pinCodeView.keyboardType = .phonePad
        pinCodeView.keyboardAppearance = .default
        pinCodeView.pinInputAccessoryView = UIView()
    //    pinCodeView.placeholder = "******"
        pinCodeView.becomeFirstResponderAtIndex = 0
    }
    
    @IBAction func continueBtnDidPressed(_ sender: Any) {
        performSegue(withIdentifier: "toSelectReasonVC", sender: self)
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
