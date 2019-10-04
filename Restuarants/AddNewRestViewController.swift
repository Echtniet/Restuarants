//
//  AddNewRestViewController.swift
//  Restuarants
//
//  Created by Davelaar,Clinton B on 10/2/19.
//  Copyright © 2019 Davelaar,Clinton B. All rights reserved.
//

import UIKit

class AddNewRestViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfHours: UITextField!
    @IBOutlet weak var tfItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add New Rest"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        
        //self.navigationItem.leftBarButtonItem?.title = "Done"
        // Do any additional setup after loading the view.
    }
    
    @objc func cancel(){
        
    }
    
    @objc func add(){
        
        let name = tfName.text
        let hours = tfHours.text
        let rest = Rest(name:name!, hours: hours!, menu: [])
        Rests.shared.addRest(rest:rest)
        
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
