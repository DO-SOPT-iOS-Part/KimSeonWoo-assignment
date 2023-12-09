//
//  UIStackView+.swift
//  assignment1
//
//  Created by Seonwoo Kim on 12/9/23.
//

import UIKit

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
    
    func clearSubViews() {
        self.arrangedSubviews.forEach{
            self.removeArrangedSubview($0) //superview에서 view 삭제
            $0.removeFromSuperview() // 자식view에서도 superview 삭제
        }
    }
}
