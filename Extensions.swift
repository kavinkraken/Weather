//
//  Extensions.swift
//  Weather
//
//  Created by Kavinkumar S Thangammal on 19/11/22.
//

import UIKit

extension Date {
    func toString(_ format: String = "yyyy/MM/dd HH:mm a") -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let strDate = dateFormatter.string(from: self)
        return strDate
    }
}
extension Data {
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}
extension UIImageView {
    func loadFrom(URLAddress: String) {
        var urlStr = URLAddress
        if !(urlStr.lowercased().contains("http")) {
            urlStr = "https:\(urlStr)"
        }
        guard let url = URL(string: urlStr) else {
            return
        }
        
//        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self.image = loadedImage
                }
            }
//        }
    }
}
