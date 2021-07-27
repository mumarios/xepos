//
//  CreatePasswordViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/21/21.
//

import UIKit
import Alamofire

class CreatePasswordViewController: UIViewController {

    @IBOutlet weak var passwordTxtField: UITextField!
    var image: UIImage?
    var vdoString: String?
    var vdoPath: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func continueBtnDidPressed(_ sender: Any) {
        //performSegue(withIdentifier: "toAddMobileNumberVC", sender: self)
        
        if passwordTxtField.text?.count  ?? 0 < 8 {
            let alertPopup = UIAlertController(title: "Please Enter password atleast 8 characters long", message: "", preferredStyle: .alert)
            alertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true)
            }))
            self.navigationController?.present(alertPopup, animated: true, completion: nil)
            return
        }
        
        register()
        
        
    }
    
    func register(){
        
        
        guard let fName = SoleTraderBusiness.shared.FirstName else {return}
        guard let Lname = SoleTraderBusiness.shared.lastName else {return}
        guard let email = SoleTraderBusiness.shared.email else {return}
        guard let phone = SoleTraderBusiness.shared.num else {return}
      //  guard let cNum = SoleTraderBusiness.shared.companyNumber else {return}
        guard let postal = SoleTraderBusiness.shared.postal else {return}
        guard let dob = SoleTraderBusiness.shared.dob    else {return}
        guard let add = SoleTraderBusiness.shared.address    else {return}
        guard let city = SoleTraderBusiness.shared.city    else {return}
        guard let pAdd = SoleTraderBusiness.shared.personalAdd    else {return}
        guard let purpose = SoleTraderBusiness.shared.category else {return}
        guard let personalAdd1 = SoleTraderBusiness.shared.personalAdd else {
            return
        }
        guard let docType = SoleTraderBusiness.shared.docType else {return}
        guard let personalpostCode = SoleTraderBusiness.shared.personalPost else {
            return
        }
        
        guard let personalCity = SoleTraderBusiness.shared.personalCity else {
            return
        }
        guard let businessName = SoleTraderBusiness.shared.businessName    else {return}
        guard let wb = SoleTraderBusiness.shared.web else {return}
         let companyDate = "2020-05-10T22:01:52.5183184+01:00"
        guard let titl = SoleTraderBusiness.shared.title else {return}
        guard let pw = passwordTxtField.text else {return}
        
        let uuid = UUID().uuidString
        
        let urlString = "http://198.244.142.151/api/user/sign-up"
    //    let parameters = ["first_name" : fName,  "last_name": Lname , "middle_name": "", "email": email, "password": pw, "title": titl, "password_confirmation": pw, "device_name": "iOS", "date_of_birth": dob, "have_you_lived_here_for_more_then_six_month": true, "terms_and_condition": true,  "business_name": businessName, "phone":"+44\(phone)", "industry_code": purpose, "type": "SoleTrader","incorporation_date": companyDate, "companyRegistrationNumber":cNum, "is_regulated": false, "trading_address_line1": add, "trading_address_country_code": "GB", "trading_address_post_code": postal, "trading_address_city": city, "registeredAddressLine1":pAdd, "web_url": wb, "documentType": docType, "unique_device_id": uuid,  "personal_user_address_line1": personalAdd1, "personal_user_address_country_code": "GB", "personal_user_address_post_code": personalpostCode, "personal_user_address_city": personalCity,  "user_login_pin": "112233"] as [String : Any]
        let headers = ["Accept":"application/json" ]
        
//        Alamofire.upload(
//        multipartFormData: { multipartFormData in
//        for (key, value) in parameters {
//        if let temp = value as? String {
//        multipartFormData.append(temp.data(using: .utf8)!, withName: key)
//        }
//        if let temp = value as? Int {
//        multipartFormData.append("(temp)".data(using: .utf8)!, withName: key)
//        }
//        if let temp = value as? NSArray {
//        temp.forEach({ element in
//        let keyObj = key + "[]"
//        if let string = element as? String {
//        multipartFormData.append(string.data(using: .utf8)!, withName: keyObj)
//        } else
//        if let num = element as? Int {
//        let value = "(num)"
//        multipartFormData.append(value.data(using: .utf8)!, withName: keyObj)
//        }
//        })
//        }
//        }
//        multipartFormData.append(image!.jpegData(compressionQuality: 0.5)!, withName: "image" , fileName: "file.jpeg", mimeType: "image/jpeg")
//        },
//            to: urlString, method: .post, headers: headers)
//        .validate(statusCode: 200..<300)
//        .response { resp in
//        switch resp.result{
//        case .failure(let error):
//        print(error)
//        case.success( _):
//        print("🥶🥶Response after upload Img: (resp.result)")
//        }
//        }
        
        var path = ""
        
        if let resourcePath = Bundle.main.resourcePath {
            let imgName = "img.jpeg"
             path = resourcePath + "/" + imgName
        }
        var semaphore = DispatchSemaphore (value: 0)

        let parameters = [
          [
            "key": "business_name",
            "value": businessName,
            "type": "text"
          ],
          [
            "key": "email",
            "value": email,
            "type": "text"
          ],
          [
            "key": "web_url",
            "value": wb,
            "type": "text"
          ],
          [
            "key": "phone",
            "value": phone,
            "type": "text"
          ],
          [
            "key": "trading_address_line1",
            "value": add,
            "type": "text"
          ],
          [
            "key": "trading_address_country_code",
            "value": "GB",
            "type": "text"
          ],
          [
            "key": "trading_address_post_code",
            "value": postal,
            "type": "text"
          ],
          [
            "key": "trading_address_city",
            "value": city,
            "type": "text"
          ],
          [
            "key": "industry_code",
            "value": purpose,
            "type": "text"
          ],
          [
            "key": "personal_user_address_line1",
            "value": personalAdd1,
            "type": "text"
          ],
          [
            "key": "personal_user_address_country_code",
            "value": "GB",
            "type": "text"
          ],
          [
            "key": "personal_user_address_post_code",
            "value": personalpostCode,
            "type": "text"
          ],
          [
            "key": "personal_user_address_city",
            "value": personalCity,
            "type": "text"
          ],
          [
            "key": "title",
            "value": titl,
            "type": "text"
          ],
          [
            "key": "first_name",
            "value": fName,
            "type": "text"
          ],
          [
            "key": "last_name",
            "value": Lname,
            "type": "text"
          ],
          [
            "key": "middle_name",
            "value": "",
            "type": "text"
          ],
          [
            "key": "date_of_birth",
            "value": dob,
            "type": "text"
          ],
          [
            "key": "password",
            "value": pw,
            "type": "text"
          ],
          [
            "key": "password_confirmation",
            "value": pw,
            "type": "text"
          ],
          [
            "key": "device_name",
            "value": "iPhone",
            "type": "text"
          ],
          [
            "key": "type",
            "value": "SoleTrader",
            "type": "text"
          ],
          [
            "key": "incorporation_date",
            "value": companyDate,
            "type": "text"
          ],
          [
            "key": "is_regulated",
            "value": "false",
            "type": "text"
          ],
          [
            "key": "front_image",
            "src": path,
            "type": "file"
          ],
          [
            "key": "back_image",
            "src": path,
            "type": "file"
          ],
          [
            "key": "video_attachment",
            "src": vdoPath,
            "type": "file"
          ],
          [
            "key": "documentType",
            "value": "passport",
            "type": "text"
          ],
          [
            "key": "unique_device_id",
            "value": uuid,
            "type": "text"
          ],
          [
            "key": "user_login_pin",
            "value": "13213123",
            "type": "text"
          ]] as [[String : Any]]

        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        for param in parameters {
          if param["disabled"] == nil {
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if param["contentType"] != nil {
              body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
              let paramValue = param["value"] as! String
              body += "\r\n\r\n\(paramValue)\r\n"
            } else {
              let paramSrc = param["src"] as! String
                do{
             // let fileData = try NSData(contentsOfFile:paramSrc, options:[]) as Data
                    let img = UIImage(named: "img.jpeg")
                    guard let fileData = img?.jpegData(compressionQuality: 0.7) else { return  }
                    let fileContent = fileData.base64EncodedString(options: .lineLength64Characters)
                    let str = fileContent.base64Decoded()
                   // let fileContent = String(decoding: fileData, as: UTF8.self)
                    body += "; filename=\"\(paramSrc)\"\r\n"
                      + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
                } catch {
                    print("err")
                }
             
            }
          }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://198.244.142.151/api/user/sign-up")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            print(String(data: data, encoding: .utf8)!)
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
                    let destinationVC = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                    self.navigationController?.pushViewController(destinationVC, animated: true)
            }
            
         
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        
        
        
        
        
        
        
        
//        let urlPath = "http://198.244.142.151/api/user/sign-up"
//            guard let endpoint = URL(string: urlPath) else {
//                    print("Error creating endpoint")
//                    return
//            }
//        var request = URLRequest(url: endpoint)
//        request.httpMethod = "POST"
//        let boundary = "Boundary-\(UUID().uuidString)"
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        let mimeType = "image/jpg"
//        let parameters = ["first_name" : fName,  "last_name": Lname , "middle_name": "", "email": email, "password": pw, "title": titl, "password_confirmation": pw, "device_name": "iOS", "date_of_birth": dob, "have_you_lived_here_for_more_then_six_month": true, "terms_and_condition": true,  "business_name": businessName, "phone":"+44\(phone)", "industry_code": purpose, "type": "SoleTrader","incorporation_date": companyDate, "companyRegistrationNumber":cNum, "is_regulated": false, "trading_address_line1": add, "trading_address_country_code": "GB", "trading_address_post_code": postal, "trading_address_city": city, "registeredAddressLine1":pAdd, "web_url": wb, "documentType": docType, "unique_device_id": uuid,  "personal_user_address_line1": personalAdd1, "personal_user_address_country_code": "GB", "personal_user_address_post_code": personalpostCode, "personal_user_address_city": personalCity,  "user_login_pin": "112233"] as [String : Any]
//        var body = Data()
//        let boundaryPrefix = " — \(boundary)\r\n"
//        for (key, value) in parameters {
//            body.append(Data(boundaryPrefix.utf8))
//            body.append(Data("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".utf8))
//            body.append(Data("\(value)\r\n".utf8))
//        }
//
//        guard let imageData = image?.jpegData(compressionQuality: 1.0) else {return}
//        let filename = "image1"
//
//        body.append(Data(boundaryPrefix.utf8))
//        body.append(Data("Content-Disposition: form-data; name=\"image\"; filename=\"\(filename)\"\r\n".utf8))
//        body.append(Data("Content-Type: \(mimeType)\r\n\r\n".utf8))
//        body.append(imageData)
//        body.append(Data("\r\n".utf8))
//        body.append(Data(" — ".appending(boundary.appending(" — ")).utf8))
//        request.httpBody = body
//
//        URLSession.shared.dataTask(with: request) { (data, res, err) in
//
//            guard let data = data else {
//                  return
//            }
//
//            do {
//              print(data)
//            } catch {
//                print("didnt work")
//            }
//
//        }.resume()
        //        var semaphore = DispatchSemaphore (value: 0)
//
//        let parameters = [
//          [
//            "key": "business_name",
//            "value": businessName,
//            "type": "text"
//          ],
//          [
//            "key": "email",
//            "value": email,
//            "type": "text"
//          ],
//          [
//            "key": "web_url",
//            "value": wb,
//            "type": "text"
//          ],
//          [
//            "key": "phone",
//            "value": phone,
//            "type": "text"
//          ],
//          [
//            "key": "trading_address_line1",
//            "value": add,
//            "type": "text"
//          ],
//          [
//            "key": "trading_address_country_code",
//            "value": "GB",
//            "type": "text"
//          ],
//          [
//            "key": "trading_address_post_code",
//            "value": postal,
//            "type": "text"
//          ],
//          [
//            "key": "trading_address_city",
//            "value": city,
//            "type": "text"
//          ],
//          [
//            "key": "industry_code",
//            "value": purpose,
//            "type": "text"
//          ],
//          [
//            "key": "personal_user_address_line1",
//            "value": pAdd,
//            "type": "text"
//          ],
//          [
//            "key": "personal_user_address_country_code",
//            "value": "GB",
//            "type": "text"
//          ],
//          [
//            "key": "personal_user_address_post_code",
//            "value": personalpostCode,
//            "type": "text"
//          ],
//          [
//            "key": "personal_user_address_city",
//            "value": personalCity,
//            "type": "text"
//          ],
//          [
//            "key": "title",
//            "value": titl,
//            "type": "text"
//          ],
//          [
//            "key": "first_name",
//            "value": fName,
//            "type": "text"
//          ],
//          [
//            "key": "last_name",
//            "value": Lname,
//            "type": "text"
//          ],
//          [
//            "key": "middle_name",
//            "value": "",
//            "type": "text"
//          ],
//          [
//            "key": "date_of_birth",
//            "value": dob,
//            "type": "text"
//          ],
//          [
//            "key": "password",
//            "value": pw,
//            "type": "text"
//          ],
//          [
//            "key": "password_confirmation",
//            "value": pw,
//            "type": "text"
//          ],
//          [
//            "key": "device_name",
//            "value": "ios",
//            "type": "text"
//          ],
//          [
//            "key": "type",
//            "value": "SoleTrader",
//            "type": "text"
//          ],
//          [
//            "key": "incorporation_date",
//            "value": "10/11/1991",
//            "type": "text"
//          ],
//          [
//            "key": "is_regulated",
//            "value": "false",
//            "type": "text"
//          ],
//          [
//            "key": "file[]",
//            "src": "/Users/Umar/Desktop/radio.fill.png",
//            "type": "file"
//          ],
//          [
//            "key": "documentType",
//            "value": docType,
//            "type": "text"
//          ],
//          [
//            "key": "unique_device_id",
//            "value": uuid,
//            "type": "text"
//          ],
//          [
//            "key": "user_login_pin",
//            "value": "13213123",
//            "type": "text"
//          ]] as [[String : Any]]
//
//        let boundary = "Boundary-\(UUID().uuidString)"
//        var body = ""
//        var error: Error? = nil
//        for param in parameters {
//          if param["disabled"] == nil {
//            let paramName = param["key"]!
//            body += "--\(boundary)\r\n"
//            body += "Content-Disposition:form-data; name=\"\(paramName)\""
//            if param["contentType"] != nil {
//              body += "\r\nContent-Type: \(param["contentType"] as! String)"
//            }
//            let paramType = param["type"] as! String
//            if paramType == "text" {
//              let paramValue = param["value"] as! String
//              body += "\r\n\r\n\(paramValue)\r\n"
//            } else {
//              let paramSrc = param["src"] as! String
//                guard let fileData = image!.jpegData(compressionQuality: 1) else{
//                         return
//                     }
//                let fileData = try NSData(contentsOf: image)
//           //   let fileData = try NSData(contentsOfFile:image, options:[]) as Data
//              let fileContent = String(data: fileData, encoding: .utf8)!
//              body += "; filename=\"\(paramSrc)\"\r\n"
//                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
//            }
//          }
//        }
//        body += "--\(boundary)--\r\n";
//        let postData = body.data(using: .utf8)
//
//        var request = URLRequest(url: URL(string: "http://198.244.142.151/api/user/sign-up")!,timeoutInterval: Double.infinity)
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        request.httpMethod = "POST"
//        request.httpBody = postData
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//          guard let data = data else {
//            print(String(describing: error))
//            semaphore.signal()
//            return
//          }
//          print(String(data: data, encoding: .utf8)!)
//          semaphore.signal()
//        }
//
//        task.resume()
//        semaphore.wait()
        
        
        
        
        
//        APIService.signup(userObj: ["firstName" : fName,  "lastName": Lname ,"email": email, "password": pw, "password_confirmation": pw, "device_name": "iOS", "dateOfBirth": dob, "have_you_lived_here_for_more_then_six_month": true, "terms_and_condition": true,  "business_name": businessName, "contactPhone":phone, "industryCode": "AccommodationAndFoodServices", "type": "LimitedCompany","incorporationDate": companyDate, "companyRegistrationNumber":cNum, "isRegulated": false, "tradingAddressLine1": add, "tradingAddressCountryCode": "GB", "tradingAddressPostCode": postal, "tradingAddressCity": city, "registeredAddressLine1":pAdd, "registeredAddressCountryCode": "GB"    ]) { (response) in
//            switch response{
//            case .success(let tokenStr):
//                print(tokenStr)
//                break
//            case .failure(let err):
//                print(err)
//                break
//            }
//        }
        
        
        
//        let urlString = "http://198.244.142.151/api/user/sign-up"
//
//
//        let parameters = ["first_name" : fName,  "last_name": Lname , "middle_name": "", "email": email, "password": pw, "title": titl, "password_confirmation": pw, "device_name": "iOS", "date_of_birth": dob, "have_you_lived_here_for_more_then_six_month": true, "terms_and_condition": true,  "business_name": businessName, "phone":"+44\(phone)", "industry_code": purpose, "type": "SoleTrader","incorporation_date": companyDate, "companyRegistrationNumber":cNum, "is_regulated": false, "trading_address_line1": add, "trading_address_country_code": "GB", "trading_address_post_code": postal, "trading_address_city": city, "registeredAddressLine1":pAdd, "web_url": wb, "documentType": docType, "unique_device_id": uuid,  "personal_user_address_line1": personalAdd1, "personal_user_address_country_code": "GB", "personal_user_address_post_code": personalpostCode, "personal_user_address_city": personalCity,  "user_login_pin": "112233"] as [String : String]
//
//        guard let imgData = image!.jpegData(compressionQuality: 1) else{
//            return
//        }
//
//
//
//            Alamofire.upload(
//                multipartFormData: { MultipartFormData in
//                //    multipartFormData.append(imageData, withName: "user", fileName: "user.jpg", mimeType: "image/jpeg")
//
//                    for (key, value) in parameters {
//                                   MultipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//                               }
//
//                    MultipartFormData.append(imgData, withName: "file[]", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
////                    MultipartFormData.append(UIImage(named: "1.png")!.jpegData(compressionQuality: 1)!, withName: "photos[2]", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
//
//
//            }, to: urlString) { (result) in
//
//                switch result {
//                case .success(let upload, _, _):
//
//                    upload.responseJSON { response in
//                        print(response.result.value)
//                    }
//
//                case .failure(let encodingError): break
//                    print(encodingError)
//                }
//
//
//            }

//        Alamofire.request(urlString, method: .post, parameters: ["first_name" : fName,  "last_name": Lname , "middle_name": "", "email": email, "documentType": docType, "password": pw, "title": titl, "password_confirmation": pw, "device_name": "iOS", "date_of_birth": dob, "have_you_lived_here_for_more_then_six_month": true, "terms_and_condition": true,  "business_name": businessName, "phone":"+44\(phone)", "industry_code": purpose, "type": "SoleTrader","incorporation_date": companyDate, "companyRegistrationNumber":cNum, "is_regulated": false, "trading_address_line1": add, "trading_address_country_code": "GB", "trading_address_post_code": postal, "trading_address_city": city, "registeredAddressLine1":pAdd, "web_url": wb, "documentType": docType, "unique_device_id": uuid, "file": "", "personal_user_address_line1": personalAdd1, "personal_user_address_country_code": "GB", "personal_user_address_post_code": personalpostCode, "personal_user_address_city": personalCity,  "user_login_pin": "112233"],encoding: JSONEncoding.default, headers: ["Content-Type": "application/json", "Accept":"application/json" ]).responseJSON {
//        response in
//          switch response.result {
//                        case .success:
//                            if response.response?.statusCode == 200{
//                            print(response)
                           
//                            }else{
//                                
//                            }
//
//                            break
//                        case .failure(let error):
//                            Alert.show(message: error.localizedDescription)
//                            print(error)
//                        }
//        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}


extension String{
    func base64Decoded() -> String? {
          guard let data = Data(base64Encoded: self) else { return nil }
          return String(data: data, encoding: .utf8)
      }
}
