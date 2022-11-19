//
//  HeaderTableViewCell.swift
//  Weather
//
//  Created by Kavinkumar S Thangammal on 19/11/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    lazy var labelCountry: UILabel! = {
        let labeltite = UILabel()
        labeltite.translatesAutoresizingMaskIntoConstraints = false
        labeltite.font = UIFont.boldSystemFont(ofSize: 18)
        labeltite.textAlignment = .center
        return labeltite
    }()
    lazy var labelTemp: UILabel! = {
        let labeltite = UILabel()
        labeltite.translatesAutoresizingMaskIntoConstraints = false
        labeltite.font = UIFont.boldSystemFont(ofSize: 50)
        labeltite.textAlignment = .center
        return labeltite
    }()
    lazy var labelCity: UILabel! = {
        let labeltite = UILabel()
        labeltite.translatesAutoresizingMaskIntoConstraints = false
        labeltite.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        labeltite.textAlignment = .center
        return labeltite
    }()
    lazy var labelDate: UILabel! = {
        let labeltite = UILabel()
        labeltite.text = Date().toString()
        labeltite.textAlignment = .center
        labeltite.translatesAutoresizingMaskIntoConstraints = false
        return labeltite
    }()
    var headerDetails: ForeCastModel? = nil {
        didSet {
            labelCountry.text = headerDetails?.getCountry()
            labelCity.text = headerDetails?.getCity()
            labelDate.text = headerDetails?.getDate()
            labelTemp.text = headerDetails?.getCurrentTemp()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubViewConstraints() {
        self.addSubview(labelTemp)
        self.addSubview(labelCountry)
        self.addSubview(labelCity)
        self.addSubview(labelDate)
        NSLayoutConstraint.activate([
            labelTemp.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            labelTemp.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            labelTemp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            labelTemp.heightAnchor.constraint(equalToConstant: 150),
            
            labelCountry.topAnchor.constraint(equalTo: self.labelTemp.bottomAnchor, constant: 0),
            labelCountry.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            labelCountry.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            labelCountry.heightAnchor.constraint(equalToConstant: 30),
            
            labelCity.topAnchor.constraint(equalTo: self.labelCountry.bottomAnchor, constant: 0),
            labelCity.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            labelCity.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            labelCity.heightAnchor.constraint(equalToConstant: 30),
            
            labelDate.topAnchor.constraint(equalTo: self.labelCity.bottomAnchor, constant: 0),
            labelDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            labelDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            labelDate.heightAnchor.constraint(equalToConstant: 30),
            labelDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
}
