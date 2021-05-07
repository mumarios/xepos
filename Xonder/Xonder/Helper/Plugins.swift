//
//  Plugins.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
import Moya

import JGProgressHUD

struct Plugin{
    static let networkPlugin = NetworkActivityPlugin.init(networkActivityClosure: { (changeType, targetType) in
        switch (changeType){
        case .began:
            UIApplication.startActivityIndicator()
        case .ended:
            UIApplication.stopActivityIndicator()
        }
    })
    
    static let authPlugin = AccessTokenPlugin(tokenClosure: {
        if let user = User.shared as User? {
            return user.token ?? AppDefault.deviceToken
        }else{
            return AppDefault.deviceToken
        }
    })
}

extension UIApplication{
    class func startActivityIndicator(with message: String? = "") {
        let hud = JGProgressHUD(style: .dark)
        hud.tag = 999
        hud.textLabel.text = message
        if let view = self.shared.keyWindow {
            hud.show(in: view)
        }
    }
    
    class func stopActivityIndicator(){
        if let hud = self.shared.keyWindow?.viewWithTag(999) as? JGProgressHUD {
            hud.dismiss()
            hud.removeFromSuperview()
        }
    }
}

