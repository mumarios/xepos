//
//  SoleTraderDocumenttSelectionViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 30/06/2021.
//

import UIKit
enum isSelected {
    case passport
    case Fdrive
    case Pdrive
    case ukCit
    case EUCit
}

class SoleTraderDocumenttSelectionViewController: UIViewController {
    @IBOutlet weak var passportCircle: UIImageView!
    @IBOutlet weak var fullDrivingCircle: UIImageView!
    @IBOutlet weak var pDrivingCircle: UIImageView!
    @IBOutlet weak var euResidenceCircle: UIImageView!
    @IBOutlet weak var residenceCircle: UIImageView!
    var selectedVal : isSelected?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func contAct(_ sender: Any) {
        
        if let val = selectedVal {
            let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "DocumentReadmeViewController") as! DocumentReadmeViewController
                self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    @IBAction func backAct(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func changeSelection(){
        switch selectedVal {
        case .passport:
            SoleTraderBusiness.shared.docType = "Passport"
            passportCircle.image = UIImage(named: "circle.fill.png")
            fullDrivingCircle.image = UIImage(named: "circle.png")
            pDrivingCircle.image = UIImage(named: "circle.png")
            euResidenceCircle.image = UIImage(named: "circle.png")
            residenceCircle.image = UIImage(named: "circle.png")
        case .EUCit:
            SoleTraderBusiness.shared.docType = "EU Identity Card"
            euResidenceCircle.image = UIImage(named: "circle.fill.png")
            passportCircle.image = UIImage(named: "circle.png")
            residenceCircle.image = UIImage(named: "circle.png")
            fullDrivingCircle.image = UIImage(named: "circle.png")
            pDrivingCircle.image = UIImage(named: "circle.png")
        case .Fdrive:
            SoleTraderBusiness.shared.docType = "Full UK Driving Licence"
            fullDrivingCircle.image = UIImage(named: "circle.fill.png")
            euResidenceCircle.image = UIImage(named: "circle.png")
            residenceCircle.image = UIImage(named: "circle.png")
            pDrivingCircle.image = UIImage(named: "circle.png")
            passportCircle.image = UIImage(named: "circle.png")
        case .Pdrive:
            SoleTraderBusiness.shared.docType = "Provisional UK Driving Licence"
            pDrivingCircle.image = UIImage(named: "circle.fill.png")
            fullDrivingCircle.image = UIImage(named: "circle.png")
            euResidenceCircle.image = UIImage(named: "circle.png")
            residenceCircle.image = UIImage(named: "circle.png")
            passportCircle.image = UIImage(named: "circle.png")
        case .ukCit:
            SoleTraderBusiness.shared.docType = "UK Residency Permit"
            residenceCircle.image = UIImage(named: "circle.fill.png")
            pDrivingCircle.image = UIImage(named: "circle.png")
            fullDrivingCircle.image = UIImage(named: "circle.png")
            euResidenceCircle.image = UIImage(named: "circle.png")
            passportCircle.image = UIImage(named: "circle.png")
        default:
            return
        }
    }
    
    @IBAction func passportAct(_ sender: Any) {
        selectedVal = .passport
        changeSelection()
    }
    
    @IBAction func fullDrivingAct(_ sender: Any) {
        selectedVal = .Fdrive
        changeSelection()
    }
    
    @IBAction func pDrivingAct(_ sender: Any) {
        selectedVal = .Pdrive
        changeSelection()
    }
    @IBAction func residenceAct(_ sender: Any) {
        selectedVal = .ukCit
        changeSelection()
    }
    @IBAction func euResidenceAct(_ sender: Any) {
        selectedVal = .EUCit
        changeSelection()
    }
    
}
