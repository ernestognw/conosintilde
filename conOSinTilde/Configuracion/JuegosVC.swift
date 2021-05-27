//
//  JuegosVC.swift
//  conOSinTilde
//
//  Created by Pamela Lozano on 25/05/21.
//

import UIKit

class JuegosVC: UITableViewController {
    
    
    var courses = [
        Course(category: "Agudas", levels: ["True/False", "Checklist", "Relate"]),
        Course(category: "Graves", levels: ["True/False", "Checklist", "Relate"]),
        Course(category: "Esdrujulas", levels: ["True/False", "Checklist", "Relate"])
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
        print(indexPath)
       self.performSegue(withIdentifier: "historial", sender: indexPath)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let svc = segue.destination as? HistorialResultadosVC {
            let indexPath = sender as! IndexPath
            if indexPath.row == 0 {
                svc.game = "TRUEFALSE"
            } else if indexPath.row == 1 {
                svc.game = "CHECKLIST"
            } else if indexPath.row == 2 {
                svc.game = "RELATE"
            }
            
            if indexPath.section == 0 {
                svc.title = "Agudas"
                svc.type = "agudas_"
            } else if indexPath.section == 1 {
                svc.title = "Graves"
                svc.type = "graves_"
            } else if indexPath.section == 2 {
                svc.title = "Esdrújulas"
                svc.type = "esdrujulas_"
            }
        }
    }

    

}
