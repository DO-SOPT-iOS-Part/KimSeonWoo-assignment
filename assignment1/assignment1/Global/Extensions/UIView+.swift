//
//  UIView+.swift
//  assignment1
//
//  Created by Seonwoo Kim on 12/9/23.
//
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }

    func setRoundBorder(borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        layer.masksToBounds = true
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
}
