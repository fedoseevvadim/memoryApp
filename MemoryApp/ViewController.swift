//
//  ViewController.swift
//  test 666
//
//  Created by Вадим Федосеев on 07/09/2019.
//  Copyright © 2019 Вадим Федосеев. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let dataSource = MemoryDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = dataSource
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("Unable to instatuate memory view controller.")
        }
        
        let item = dataSource.item(at: indexPath.row)
        vc.item = item
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
