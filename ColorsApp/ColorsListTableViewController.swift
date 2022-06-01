//
//  ColorsListTableViewController.swift
//  ColorsApp
//
//  Created by Osher Yeffet on 01/06/2022.
//

import UIKit
// swiftlint:disable line_length
class ColorsListTableViewController: UITableViewController {

//    var colors: Colors?
    var colors: Colors?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let localData = colors?.readLocalFile(forName: "data") {
            colors!.parse(jsonData: localData)
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
//        downloadJson()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
//    let url = URL(string: "https://raw.githubusercontent.com/OwnHealthIL/ios-internship-final-exam-osher-yeffet/master/colors.json?token=GHSAT0AAAAAABVB2JJGURDZDECNMR3WKR7WYUXG6BQ")

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colors.self?.colors.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as? ColorTableViewCell
//        cell?.colorNameLabel.text = colors?.colors[indexPath.row].color_name
//        cell?.colorDescriptionLabel.text = "Description:" + (colors?.colors[indexPath.row].color_description)
        return cell!
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
