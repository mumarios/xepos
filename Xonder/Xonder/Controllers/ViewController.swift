//
//  ViewController.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/6/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        APIService.getCountries { (countries, err) in
//            if err == nil{
//                guard let cc = countries else {
//                    return
//                }
//                print("WOW \(cc.first?.name)")
//            }
//        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        APIService.login(userObj: ["email" : "saeeb22@saeeb2.com","password":"12345678","device_name":"ios"]) { (response) in
            switch response{
            case .success(let tokenStr):
                print(tokenStr)
                break
            case .failure(let err):
                print(err)
                break
            }
        }
    }

}

