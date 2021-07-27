//
//  DocumentScanViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 30/06/2021.
//

import UIKit
import VisionKit

class DocumentScanViewController: UIViewController {
    @IBOutlet weak var imggView: UIImageView!
    var img: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        getDocView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tryAgainAct(_ sender: Any) {
        getDocView()
    }
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func contAct(_ sender: Any) {
        if let image = img{
        let storyboard = UIStoryboard(name: "SignupUmar", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "VideoTermsViewController") as! VideoTermsViewController
        destinationVC.image = image
            self.navigationController?.pushViewController(destinationVC, animated: true)
        } else {
            let alertPopup = UIAlertController(title: "Please Scan Document", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
        }
    }
    
    private func getDocView(){
        let scanVC = VNDocumentCameraViewController()
        scanVC.delegate = self
        self.present(scanVC, animated: true, completion: nil)
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

extension DocumentScanViewController: VNDocumentCameraViewControllerDelegate{
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        for pageNumber in 0..<scan.pageCount{
            let image = scan.imageOfPage(at: pageNumber)
            self.imggView.image = image
            img = image
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
