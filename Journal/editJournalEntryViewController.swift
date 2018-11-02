//
//  ViewController.swift
//  Journal
//
//  Created by Justin Snider on 11/2/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit

class editJournalEntryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entry = entry{
            navigationItem.title = entry.title
            titleTextField.text = entry.title
            descriptionTextField.text = entry.description
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let sender = sender as? UIBarButtonItem, sender == saveButton else {fatalError("This should never happen")}
        
        let title = titleTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        
        entry = Entry(title: title, description: description)
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The ThingViewController is not inside a navigation controller.")
        }
    }
    
}

