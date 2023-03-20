//
//  CornerRadius+Extension.swift
//  Onboarding
//
//  Created by Maheen on 06/06/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
