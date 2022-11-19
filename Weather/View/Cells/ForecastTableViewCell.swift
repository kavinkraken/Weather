//
//  ForecastTableViewCell.swift
//  Weather
//
//  Created by Kavinkumar S Thangammal on 19/11/22.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    lazy var iconImage: UIImageView! = {
        let iconImg = UIImageView()
        iconImg.translatesAutoresizingMaskIntoConstraints = false
        return iconImg
    }()
    lazy var labelTemp: UILabel! = {
        let labeltite = UILabel()
        labeltite.translatesAutoresizingMaskIntoConstraints = false
        labeltite.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return labeltite
    }()
    lazy var labelDate: UILabel! = {
        let labeltite = UILabel()
        labeltite.translatesAutoresizingMaskIntoConstraints = false
        return labeltite
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var forecastDetails: Forecastday? = nil {
        didSet {
            labelDate.text = forecastDetails?.date
            labelTemp.text = forecastDetails?.getMinMaxTemp()
            self.getImage()
        }
    }
    func getImage() {
        ServerCallController.callForGet(urlString: forecastDetails?.getIcon() ?? "") { success, response, message in
            if success ,let loadedImage = UIImage(data: response ?? Data()) {
                DispatchQueue.main.async {
                    self.iconImage.image = loadedImage
                }
            }
        }
    }
    
    func addSubViewConstraints() {
        self.addSubview(iconImage)
        self.addSubview(labelTemp)
        self.addSubview(labelDate)
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            iconImage.heightAnchor.constraint(equalToConstant: 30),
            iconImage.widthAnchor.constraint(equalToConstant: 30),
            iconImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            labelTemp.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            labelTemp.leadingAnchor.constraint(equalTo: self.iconImage.trailingAnchor, constant: 10),
            labelTemp.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            labelDate.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            labelDate.leadingAnchor.constraint(equalTo: self.labelTemp.trailingAnchor, constant: 10),
            labelDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            labelDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
}
