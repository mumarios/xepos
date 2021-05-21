//
//  CardView.swift
//  Realtor
//
//  Created by Muhammad Umar on 23/09/2020.
//

import UIKit

@IBDesignable
class CardView: UIView {

   // @IBInspectable var cornerRadius: CGFloat = 2

    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var shadowsColor: UIColor? = UIColor.black
   // @IBInspectable var shadowOpacity: Float = 0.2

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowsColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = 0.2
        layer.shadowPath = shadowPath.cgPath
    }

}
