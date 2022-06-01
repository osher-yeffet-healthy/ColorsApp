//
//  ColorsListTableViewController.swift
//  ColorsApp
//
//  Created by Osher Yeffet on 01/06/2022.
//

import UIKit
// swiftlint:disable line_length
class ColorsListTableViewController: UITableViewController {
    var colorList = Colors(colors: [])
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colorList.colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as? ColorTableViewCell
        cell!.colorNameLabel.text = colorList.colors[indexPath.row].color_name
        cell?.colorDescriptionLabel.text = colorList.colors[indexPath.row].color_description
        let rgb = colorList.colors[indexPath.row].color_values
        cell?.colorView.backgroundColor = UIColor(red: Int(rgb["r"]!), green: Int(rgb["g"]!), blue: Int(rgb["b"]!))
        return cell!
    }

    func fetchData() {
        guard let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") else { return }
        do {
            let jsonData = (try? Data(contentsOf: fileLocation))!
            let receivedData = try? JSONDecoder().decode(Colors.self, from: jsonData)
            self.colorList = receivedData!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("something wrong")
        }
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
    // MARK: - Navigation
    var selected: Colors?
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SingleColorViewController {
            if let pressedRow = sender as? ColorTableViewCell {
                destination.view.backgroundColor = UIColor.black
            }
        } else {
            return
        }
    }
}

// swiftlint:disable identifier_name
extension UIColor {
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return NSString(format: "#%06x", rgb) as String
    }
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
