//
//  VideoTermsViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 12/07/2021.
//

import UIKit
import AVKit
import MobileCoreServices

class VideoTermsViewController: UIViewController {

    var controller = UIImagePickerController()
    let videoFileName = "/video.mp4"
    var  path = ""
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func openVideo(_ sender: Any) {
        // 1 Check if project runs on a device with camera available
           if UIImagePickerController.isSourceTypeAvailable(.camera) {
                   
               // 2 Present UIImagePickerController to take video
               controller.sourceType = .camera
               controller.mediaTypes = [kUTTypeMovie as String]
               controller.delegate = self
                   
               present(controller, animated: true, completion: nil)
           }
           else {
               print("Camera is not available")
           }


        
        
        
    }
 


}


// MARK: - UIImagePickerControllerDelegate
extension VideoTermsViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 1
        if let selectedVideo:URL = (info[UIImagePickerController.InfoKey.mediaURL] as? URL) {
            // Save video to the main photo album
            let selectorToCall = #selector(self.videoSaved(_:didFinishSavingWithError:context:))
              
            // 2
            UISaveVideoAtPathToSavedPhotosAlbum(selectedVideo.relativePath, self, selectorToCall, nil)
            // Save the video to the app directory
            let videoData = try? Data(contentsOf: selectedVideo)
            let paths = NSSearchPathForDirectoriesInDomains(
                FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            let documentsDirectory: URL = URL(fileURLWithPath: paths[0])
            let dataPath = documentsDirectory.appendingPathComponent(videoFileName)
            path = dataPath.absoluteString
            try! videoData?.write(to: dataPath, options: [])
        }
        // 3
        picker.dismiss(animated: true)
    }
    @objc func videoSaved(_ video: String, didFinishSavingWithError error: NSError!, context: UnsafeMutableRawPointer){
        if let theError = error {
            
            print("error saving the video = \(theError)")
        } else {
           DispatchQueue.main.async(execute: { () -> Void in
            let storyboard = UIStoryboard(name: "Signup", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "CreatePasswordViewController") as! CreatePasswordViewController
            destinationVC.image = self.image
            destinationVC.vdoString = video
            destinationVC.vdoPath = self.path
                self.navigationController?.pushViewController(destinationVC, animated: true)
           })
        }
    }
}

// MARK: - UINavigationControllerDelegate
extension VideoTermsViewController: UINavigationControllerDelegate {
}

