//
//  TableViewController.swift
//  List
//
//  Created by Станислав Зверьков on 24.10.2022.
//

import UIKit

class TableViewController: UITableViewController {

}

//  MARK: - UITableViewDataSource

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//  MARK: - UITableViewDelegate

extension TableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
