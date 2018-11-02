//
//  journalTableViewController.swift
//  Journal
//
//  Created by Justin Snider on 11/2/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit

class journalTableViewController: UITableViewController {
    
    var entries: [Entry] = []
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalEntry", for: indexPath) as! journalEntryTableViewCell
        
        formatter.dateFormat = "dd-MM-yyyy"
        
        cell.titleLabel.text = entries[indexPath.row].title
        cell.descriptionLabel.text = entries[indexPath.row].description
        cell.dateLabel.text = formatter.string(for: entries[indexPath.row].currentDate)
        
        return cell
    }
    
    @IBAction func unwindToJournalTableView(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? editJournalEntryViewController, let entry = sourceVC.entry {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                entries[selectedIndexPath.row] = entry
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                
                entries.append(entry)
                tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "addEntry" {
            segue.destination.navigationItem.title = "New Journal Entry"
        } else if segue.identifier == "editEntry" {
            guard let destination = segue.destination as? editJournalEntryViewController else {fatalError("This should never happen")}
            
            let currentEntry = entries[tableView.indexPathForSelectedRow!.row]
            
            destination.entry = currentEntry
        }else {
            fatalError("This should never happen")
        }
    }

}
