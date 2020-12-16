//
//  ViewClassesViewController.swift
//  GU
//
//  Created by Kyle Pavey on 12/1/20.
//

import UIKit
import CoreData

class ViewClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var classes = [Class]()
    var selectedRow: Int = 0
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadTrips()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return classes.count
        }
        return 0
      }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let userClass = classes[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath) as! ClassTableViewCell
        cell.update(with: userClass)
        return cell
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let userClass = classes.remove(at: sourceIndexPath.row)
        classes.insert(userClass, at: destinationIndexPath.row)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(classes[indexPath.row])
            classes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveTrip()
        }
    }

    /**
     Sets up both of the other view controllers with associated information
     */
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let identifier = segue.identifier {
//                if let classDetailVC = segue.destination as? TripDetailViewController {
//                    if let indexPath = tableView.indexPathForSelectedRow {
//                        selectedRow = indexPath.row
//                        let userClass = classes[selectedRow]
//                        classDetailVC.tripOptional = userClass
//                        classDetailVC.rowValueString = "Class \(String(selectedRow + 1)) of \(classes.count)"
//                    }
//                }
//        }
//    }

    /**
     Changes the focus after the save button is pressed, adds the new trip to the table
     */
//    @IBAction func unwindTripTable(segue: UIStoryboardSegue) {
//        if let identifier = segue.identifier {
//            if identifier == "SaveUnwindSegue" {
//                if let addTripVC = segue.source as? AddTripViewController {
//                     let trip = addTripVC.newTrip
//                        if let indexPath = tableView.indexPathForSelectedRow {
//                            classes[indexPath.row] = trip
//                            tableView.reloadData()
//                        }
//                        else {
//                            classes.append(trip)
//                            tableView.reloadData()
//                        }
//                    }
//            }
//        }
//    }

    /**
     Changes screen focus back to table view controller from cancel button
     */
    @IBAction func unwindCancelAdd(segue: UIStoryboardSegue) {}

    /**
     Starts editing mode when edit button is pressed
     Parameters: the edit button
     */
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        let newEditingMode = !tableView.isEditing
        tableView.setEditing(newEditingMode, animated: true)
    }


    /// Loads the trip array with the trips from the database
    func loadTrips() {
        let request: NSFetchRequest<Class> = Class.fetchRequest()
        do {
            classes = try context.fetch(request)
        }
        catch {
            print("Error loading trip data")
        }
        tableView.reloadData()
    }


    /// Saves the updated trip
    func saveTrip() {
        do {
            try context.save()
        }
        catch {
            print("Error saving")
        }
        tableView.reloadData()
    }


}
