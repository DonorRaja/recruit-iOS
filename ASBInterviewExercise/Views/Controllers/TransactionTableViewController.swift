//
//  TransactionTableViewController.swift
//  ASBInterviewExercise
//
//  Created by DonorRaja on 16/12/21.
//

import UIKit

class TransactionTableViewController: UITableViewController {
    
    
    
    
    //MARK: - Variables
    var transactions = [Transaction]()
    
    var currentTransactions: [String:[Transaction]] = [:]
    
    var transactionList:[String] = [String]()
    
    
   //MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.getTransactionDataRequest()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    
    //MARK: - JSON Request
    func getTransactionDataRequest() {
        
        if let url = URL(string: ASB.API.apiURL + ASB.API.transactions) {
               if let data = try? Data(contentsOf: url) {

                   let decoder = JSONDecoder()

                       if let jsonData = try? decoder.decode(Array<Transaction>.self, from: data) {
                           print(jsonData)
                           self.transactions = jsonData
                           
                           for (key,value) in self.transactions.enumerated() {
                               self.transactions[key].transactionDate = Utility.convertDateFormater(value.transactionDate)
                               
                           }
                           self.currentTransactions = Dictionary(grouping: self.transactions, by: { $0.transactionDate })
                           
                       }else {
                           print("error")
                           
                       }
               }
           }
    }
    
    func getLists() {
        transactionList = Array(currentTransactions.keys)
        transactionList = transactionList.sorted {$0.compare($1, options: .numeric) == .orderedDescending}
    
    }
    
    func getNumberOfEntrysInSection (Section: Int) -> Int {

        let transaction:String = self.transactionList[Section]

        let value:[Transaction] = currentTransactions[transaction]!

        return value.count
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        self.getLists()
        return self.transactionList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return getNumberOfEntrysInSection(Section: section)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return transactionList[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableViewCell

       let sectionList = self.transactionList[indexPath.section]
        let rowsList = self.currentTransactions[sectionList]
        
        // Configure the cell...
        let transactionData = rowsList![indexPath.row]
        cell.transactionName.text = transactionData.summary
        
        var detailText = ""
        if transactionData.credit != 0 {
            detailText = "+ \(transactionData.credit)"
            cell.transactionAmount.textColor = .green
        }else {
            detailText = "- \(transactionData.debit)"
            cell.transactionAmount.textColor = .red
        }
        cell.transactionAmount.text = detailText

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "sendDataSegue", sender: indexPath)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sendDataSegue" {
            let indexPath = sender as! IndexPath
            let vc = segue.destination as! TransactionDetailsViewController
            let transactionDetail = self.transactions[indexPath.row]
            vc.transactionDetails = transactionDetail
        }
    }

}
