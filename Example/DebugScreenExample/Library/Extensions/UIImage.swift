//
//  UIImage.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import UIKit

extension UIImage {

    /// Init method for creating UIImage of a given color
    /// - Parameters:
    ///     - color: Optional value, by default clear color
    ///     - size: Optional value, by default size 1*1
    convenience init?(color: UIColor?, size: CGSize = CGSize(width: 1, height: 1)) {
        let color = color ?? UIColor.clear
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }

    /// Method return UIImage with given alpha
    func mask(with alpha: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }

}
