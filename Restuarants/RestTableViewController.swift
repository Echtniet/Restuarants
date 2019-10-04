//
//  RestTableViewController.swift
//  Restuarants
//
//  Created by Davelaar,Clinton B on 9/23/19.
//  Copyright © 2019 Davelaar,Clinton B. All rights reserved.
//

import UIKit

class RestTableViewController: UITableViewController {
    
    let rowHeight:CGFloat = 75.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Restuarant of Maryville!"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Rests", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
    }
    @objc func add(){
        
        var vcNewitem = storyboard!.instantiateViewController(withIdentifier: "newrest")
        
        self.present(vcNewitem, animated: true, completion: nil)
        self.tableView.reloadData()
        /*let ac = UIAlertController(title: "Add Rest", message: "Please", preferredStyle: .alert)
        ac.addTextField(configurationHandler: nil)
        ac.addTextField(configurationHandler: nil)
        ac.textFields![0].placeholder = "Name"
        ac.textFields![1].placeholder = "Hours"
        let action = UIAlertAction(title: "Ok", style: .default){
            (action) -> Void in
            let name = ac.textFields![0].text
            let hours = ac.textFields![1].text
            let rest = Rest(name:name!, hours: hours!, menu: [])
            Rests.shared.addRest(rest:rest)
            self.tableView.reloadData()
        }
        ac.addAction(action)
        self.present(ac, animated: true)
        */
        
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Rests.shared.numRests()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rest", for: indexPath)
        
        
        let rest = Rests.shared[indexPath.row]
        cell.textLabel?.text = rest.name
        cell.detailTextLabel?.text = rest.hours
        cell.imageView?.image = UIImage(named: rest.name)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Rests.shared.deleteRest(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var tvcMenu = storyboard!.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        
        tvcMenu.rest = Rests.shared[indexPath.row]
        
        self.navigationController!.pushViewController(tvcMenu, animated: true)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
