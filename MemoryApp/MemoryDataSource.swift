//
//  MemoryDataSource.swift
//  test 666
//
//  Created by Вадим Федосеев on 07/09/2019.
//  Copyright © 2019 Вадим Федосеев. All rights reserved.
//

import UIKit

class MemoryDataSource: NSObject, UITableViewDataSource {

    var items = [MemoryItem]()
    
    override init () {
        
        guard let url = Bundle.main.url(forResource: "items", withExtension: "json") else {
            fatalError("Cant' find JSON")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load JSON.")
        }
        
        let decoder = JSONDecoder()
        
        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data) else {
            fatalError("Failed to decode JSON")
        }
        
        items = savedItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func item (at index: Int) -> MemoryItem {
        return items[index]
    }
}
