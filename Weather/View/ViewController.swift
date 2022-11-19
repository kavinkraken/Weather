//
//  ViewController.swift
//  Weather
//
//  Created by Kavinkumar S Thangammal on 18/11/22.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableViewList: UITableView! = {
        let tableview = UITableView(frame: .zero)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(HeaderTableViewCell.self, forCellReuseIdentifier: "HeaderTableViewCell")
        tableview.register(ForecastTableViewCell.self, forCellReuseIdentifier: "ForecastTableViewCell")
        return tableview
    }()
    private var controller: WeatherController?
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        self.addSubView()
    }
    
    func addSubView() {
        self.view.addSubview(tableViewList)
        NSLayoutConstraint.activate([
            self.tableViewList.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableViewList.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableViewList.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tableViewList.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        controller = WeatherController(delegate: self)
    }
}

extension ViewController : WeatherDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableViewList.reloadData()
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (controller?.numberOfRowsInSection(section: section))!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (controller?.cellForRowAt(tableView, indexPath: indexPath))!
    }
}

