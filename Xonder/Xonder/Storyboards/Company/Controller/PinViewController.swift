//
//  PinViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 06/08/2021.
//

import UIKit
import KAPinField
import Alamofire
class PinViewController: UIViewController {

    var image: UIImage?
    var vdoString: String?
    var vdoPath: String?
    @IBOutlet weak var pinField: KAPinField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinField.properties.token = "-" // Default to "•"
        pinField.properties.numberOfCharacters = 6 // Default to 4
        pinField.properties.validCharacters = "0123456789" // Default to only numbers, "0123456789"
        pinField.properties.animateFocus = true // Animate the currently focused token
        pinField.properties.isSecure = false // Secure pinField will hide actual input
        pinField.properties.secureToken = "*" // Token used to hide actual character input when using isSecure = true
        
        pinField.properties.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func doneac(_ sender: Any) {
        
        if SoleTraderBusiness.shared.isBusiness {
            registerCompany()
        } else {
            registerSole()
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
    func registerCompany(){
        
    
        let fName = SoleTraderBusiness.shared.FirstName  ?? ""
        let Lname = SoleTraderBusiness.shared.lastName ?? ""
        let email = SoleTraderBusiness.shared.email ?? ""
        let phone = SoleTraderBusiness.shared.num ?? ""

        let postal = SoleTraderBusiness.shared.postal ?? ""
        let dob = SoleTraderBusiness.shared.dob    ?? ""
        let add = SoleTraderBusiness.shared.tradingAdd    ?? ""
        let city = SoleTraderBusiness.shared.city    ?? ""
        let pAdd = SoleTraderBusiness.shared.personalAdd    ?? ""
        let purpose = SoleTraderBusiness.shared.category ?? ""
        let personalAdd1 = SoleTraderBusiness.shared.personalAdd ?? ""
        let docType = SoleTraderBusiness.shared.docType ?? ""
        let personalpostCode = SoleTraderBusiness.shared.personalPost ?? ""
       
        let personalCity = SoleTraderBusiness.shared.personalCity ?? ""
        let businessName = SoleTraderBusiness.shared.businessName    ?? ""
        let wb = SoleTraderBusiness.shared.web ?? ""
      //  let companyDate = "2020-05-10T22:01:52.5183184+01:00"
        let titl = SoleTraderBusiness.shared.title ?? ""
        let pw = SoleTraderBusiness.shared.pw
       
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
            "value": SoleTraderBusiness.shared.businessName,
            "type": "text"
          ],
          [
            "key": "email",
            "value": SoleTraderBusiness.shared.firstUserEmail,
            "type": "text"
          ],
          [
            "key": "phone",
            "value": SoleTraderBusiness.shared.num,
            "type": "text"
          ],
          [
            "key": "industry_code",
            "value": SoleTraderBusiness.shared.category,
            "type": "text"
          ],
          [
            "key": "type",
            "value": "LimitedCompany",
            "type": "text"
          ],
          [
            "key": "incorporation_date",
            "value": SoleTraderBusiness.shared.companyDate,
            "type": "text"
          ],
          [
            "key": "company_registration_number",
            "value": SoleTraderBusiness.shared.companyNumber,
            "type": "text"
          ],
          [
            "key": "is_regulated",
            "value": "false",
            "type": "text"
          ],
          [
            "key": "trading_address_line1",
            "value": SoleTraderBusiness.shared.tradingAdd,
            "type": "text"
          ],
          [
            "key": "trading_address_country_code",
            "value": "GB",
            "type": "text"
          ],
          [
            "key": "trading_address_post_code",
            "value": SoleTraderBusiness.shared.postal,
            "type": "text"
          ],
          [
            "key": "trading_address_city",
            "value": SoleTraderBusiness.shared.loc,
            "type": "text"
          ],
          [
            "key": "web_url",
            "value": "http://google.com",
            "type": "text"
          ],
          [
            "key": "password",
            "value": SoleTraderBusiness.shared.pw,
            "type": "text"
          ],
          [
            "key": "password_confirmation",
            "value": SoleTraderBusiness.shared.pw,
            "type": "text"
          ],
          [
            "key": "device_name",
            "value": "macos",
            "type": "text"
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
            "value": self.pinField.text,
            "type": "text"
          ],
          [
            "key": "contact[0][title_0]",
            "value": SoleTraderBusiness.shared.firstUsertitle,
            "type": "text"
          ],
          [
            "key": "contact[0][first_name_0]",
            "value": SoleTraderBusiness.shared.firstUserFirstName,
            "type": "text"
          ],
          [
            "key": "contact[0][last_name_0]",
            "value": SoleTraderBusiness.shared.firstUserLastName,
            "type": "text"
          ],
          [
            "key": "contact[0][middle_name_0]",
            "value": "",
            "type": "text"
          ],
          [
            "key": "contact[0][date_of_birth_0]",
            "value": SoleTraderBusiness.shared.firstUserdob,
            "type": "text"
          ],
          [
            "key": "contact[0][personal_user_address_line1_0]",
            "value": SoleTraderBusiness.shared.tradingAdd,
            "type": "text"
          ],
          [
            "key": "contact[0][personal_user_address_country_code_0]",
            "value": "GB",
            "type": "text"
          ],
          [
            "key": "contact[0][personal_user_address_post_code_0]",
            "value": SoleTraderBusiness.shared.postal,
            "type": "text"
          ],
          [
            "key": "contact[0][personal_user_address_city_0]",
            "value": SoleTraderBusiness.shared.loc,
            "type": "text"
          ],
          [
            "key": "contact[0][number_of_shares_0]",
            "value": SoleTraderBusiness.shared.firstUserShares,
            "type": "text"
          ],
          [
            "key": "contact[0][is_main_applicant_0]",
            "value": "true",
            "type": "text"
          ],
          [
            "key": "contact[0][officer_role_0]",
            "value": "director",
            "type": "text"
          ],
          [
            "key": "contact[0][email_0]",
            "value": SoleTraderBusiness.shared.firstUserEmail,
            "type": "text"
          ],
          [
            "key": "contact[0][phone_0]",
            "value": SoleTraderBusiness.shared.num,
            "type": "text"
          ],
          [
            "key": "front_image1",
            "src": path,
            "type": "file"
          ],
          [
            "key": "back_image1",
            "src": path,
            "type": "file"
//          ],
//          [
//            "key": "contact[1][email_1]",
//            "value": "personalEmail1@test.com",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][personal_user_address_line1_1]",
//            "value": "12 Purple Place",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][personal_user_address_country_code_1]",
//            "value": "GB",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][personal_user_address_post_code_1]",
//            "value": "SW34 5TJ",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][personal_user_address_city_1]",
//            "value": "London",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][title_1]",
//            "value": "Mr",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][first_name_1]",
//            "value": "Shafi28",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][last_name_1]",
//            "value": "Muhammad",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][middle_name_1]",
//            "value": "Shafi28",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][date_of_birth_1]",
//            "value": "10/11/1991",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][number_of_shares_1]",
//            "value": "30",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][is_main_applicant_1]",
//            "value": "false",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][officer_role_1]",
//            "value": "secretary",
//            "type": "text"
//          ],
//          [
//            "key": "contact[1][phone_1]",
//            "value": "+447843054730",
//            "type": "text"
//          ],
//          [
//            "key": "front_image2",
//            "src": path,
//            "type": "file"
//          ],
//          [
//            "key": "back_image2",
//            "src": path,
//            "type": "file"
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
                 guard  let fileData = img?.jpegData(compressionQuality: 0.7) else { return  }
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
//             let endpoint = URL(string: urlPath) else {
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
//         let imageData = image?.jpegData(compressionQuality: 1.0) ?? ""
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
//             let data = data else {
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
//                 let fileData = image!.jpegData(compressionQuality: 1) else{
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
//           let data = data else {
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
//         let imgData = image!.jpegData(compressionQuality: 1) else{
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
   func registerSole() {
        
        
         let fName = SoleTraderBusiness.shared.FirstName  ?? ""
         let Lname = SoleTraderBusiness.shared.lastName ?? ""
         let email = SoleTraderBusiness.shared.email ?? ""
         let phone = SoleTraderBusiness.shared.num ?? ""
 
         let postal = SoleTraderBusiness.shared.postal ?? ""
         let dob = SoleTraderBusiness.shared.dob    ?? ""
         let add = SoleTraderBusiness.shared.address    ?? ""
         let city = SoleTraderBusiness.shared.city    ?? ""
         let pAdd = SoleTraderBusiness.shared.personalAdd    ?? ""
         let purpose = SoleTraderBusiness.shared.category ?? ""
         let personalAdd1 = SoleTraderBusiness.shared.personalAdd ?? ""
         let docType = SoleTraderBusiness.shared.docType ?? ""
         let personalpostCode = SoleTraderBusiness.shared.personalPost ?? ""
        
         let personalCity = SoleTraderBusiness.shared.personalCity ?? ""
         let businessName = SoleTraderBusiness.shared.businessName    ?? ""
         let wb = SoleTraderBusiness.shared.web ?? ""
       //  let companyDate = "2020-05-10T22:01:52.5183184+01:00"
         let titl = SoleTraderBusiness.shared.title ?? ""
         let pw = SoleTraderBusiness.shared.pw
        
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

        var parameters =  [[String : Any]]()
        
        if SoleTraderBusiness.shared.isBusiness{
             let cNum = SoleTraderBusiness.shared.companyNumber ?? ""
             let cDate = SoleTraderBusiness.shared.companyDate ?? ""
            let tradingadd1 = SoleTraderBusiness.shared.tradingAdd ?? ""
            let traddingadd2 = SoleTraderBusiness.shared.tradingAdd2 ?? ""
            let tradingpostal = SoleTraderBusiness.shared.postal ?? ""
            let tradingCity = SoleTraderBusiness.shared.loc ?? ""
            parameters  = [
                [
                  "key": "tradingAddressLine1",
                  "value": tradingadd1,
                  "type": "text"
                ],
                [
                    "key": "trading_address_line1",
                    "value": add,
                    "type": "text"
                  ],

                [
                  "key": "tradingAddressCountryCode",
                  "value": "GB",
                  "type": "text"
                ],
                [
                  "key": "tradingAddressPostCode",
                  "value": tradingpostal,
                  "type": "text"
                ],
                [
                  "key": "tradingAddressCity",
                  "value": tradingCity,
                  "type": "text"
                ],
                [
                  "key": "companyRegistrationNumber",
                  "value": cNum,
                  "type": "text"
                ],
             
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
                ]]
        } else {
            [
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
//              [
//                "key": "incorporation_date",
//                "value": companyDate,
//                "type": "text"
//              ],
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
              ]]
        }

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
                  guard  let fileData = img?.jpegData(compressionQuality: 0.7) else { return  }
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
//             let endpoint = URL(string: urlPath) else {
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
//         let imageData = image?.jpegData(compressionQuality: 1.0) ?? ""
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
//             let data = data else {
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
//                 let fileData = image!.jpegData(compressionQuality: 1) else{
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
//           let data = data else {
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
//         let imgData = image!.jpegData(compressionQuality: 1) else{
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

}
extension PinViewController : KAPinFieldDelegate {
  func pinField(_ field: KAPinField, didFinishWith code: String) {
    print("didFinishWith : \(code)")
  }
}
