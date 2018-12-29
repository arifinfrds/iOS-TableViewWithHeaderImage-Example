//
//  ViewController.swift
//  CollapsingTableViewHeader
//
//  Created by Arifin Firdaus on 12/29/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.transparentNavBar(tintColor: .white)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    private func setupCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    let img = #imageLiteral(resourceName: "image-1")
    let imageView = UIImageView(image: #imageLiteral(resourceName: "image-1"))

}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Lorem Ipsum ..."
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerImageView = imageView
        return headerImageView
    }
 
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let w = view.frame.size.width
        let imgw = img.size.width
        let imgh = img.size.height
        return w/imgw*imgh
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let verticalOffset = tableView.contentOffset.y
        verticalOffset >= 64
            ? setupNavbarAppereanceNotTransparentWhenScolling()
            : setupNavBarAppereanceTransparentWhenScrolling()
    }
    
}


extension ViewController {
    
    private func setupNavbarAppereanceNotTransparentWhenScolling() {
        navigationController?.unTransparentNavBar(tintColor: .blue, barTintColor: .white)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setupNavBarAppereanceTransparentWhenScrolling() {
        navigationController?.transparentNavBar(tintColor: .white)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
}

