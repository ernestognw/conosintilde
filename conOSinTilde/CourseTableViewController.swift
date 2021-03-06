//
//  CourseTableViewController.swift
//  conOSinTilde
//
//  Created by Rodrigo Casale on 21/04/21.
//

import UIKit

class CourseTableViewController: UITableViewController {
    
    
    var courses = [
        Course(category: "Agudas", levels: ["Verdadero/Falso", "Selecciona", "Relaciona"]),
        Course(category: "Graves", levels: ["Verdadero/Falso", "Selecciona", "Relaciona"]),
        Course(category: "Esdrujulas", levels: ["Verdadero/Falso", "Selecciona", "Relaciona"])
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return courses.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses[section].levels?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = courses[indexPath.section].levels?[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return courses[section].category
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: String(indexPath.section), sender: indexPath)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let svc = segue.destination as? AccentDetail {
            let indexPath = sender as! IndexPath
            svc.level = indexPath.row
            
            if indexPath.section == 0 {
                svc.title = "Agudas"
                svc.gameType = .AGUDAS
            } else if indexPath.section == 1 {
                svc.title = "Graves"
                svc.gameType = .GRAVES
            } else if indexPath.section == 2 {
                svc.title = "Esdr??julas"
                svc.gameType = .ESDRUJULAS
            }
        }
    }
    
    @IBAction func goBack() {
        dismiss(animated: true)
    }
    

}
