//
//  Extension.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 09.06.2021.
//

import UIKit

extension UITextField {
func setIcon(_ image: UIImage?) {
   let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 5, width: 20, height: 20))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 40, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}

//        let back = UIImageView(image:UIImage(named: "background"))
//        let blurEffect = UIBlurEffect(style: .dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        back.addSubview(blurEffectView)

func blurImage(usingImage image: UIImage?, blurAmount: CGFloat) -> UIImage? {
    guard let ciImage = CIImage(image: image!) else { return nil}
    let blurFilter = CIFilter(name: "CIGaussianBlur")
    blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
    blurFilter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
    guard let outputImage = blurFilter?.outputImage else {return nil}
    return UIImage(ciImage: outputImage)
}
