//
//  TransactionDetailsViewController.swift
//  ASBInterviewExercise
//
//  Created by DonorRaja on 16/12/21.
//

import UIKit

class TransactionDetailsViewController: UIViewController {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var transactionName: UILabel!
    @IBOutlet weak var transactionDate: UILabel!
    @IBOutlet weak var transactionView: UIView!
    @IBOutlet weak var transactionType: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var gstLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var transactionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var totalAmountTopConstraint: NSLayoutConstraint!
    
    
    //MARK: - Variables
    var transactionDetails: Transaction!
    
    
    //MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTransactionDetails()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Functions
    
    func loadTransactionDetails(){
        
        self.transactionName.text = transactionDetails.summary
        self.transactionDate.text = "Date: \(transactionDetails.transactionDate)"
        var gstAmount = 0.0
        var currntAmount = 0.0
        self.gstLabel.isHidden = false
        self.amountLabel.isHidden = false
        self.transactionViewHeight.constant = 90.0
        self.totalAmountTopConstraint.constant = 58
        if transactionDetails.debit != 0 {
            self.totalAmount.textColor = .red
            self.totalAmount.text = "Total Amount: \(Utility.makeCurrencyFormatter(currentAmount: transactionDetails.debit))"
            self.transactionType.text = "Transaction Type : DEBIT"
            gstAmount = Utility.calculateGST(excludeGST: transactionDetails.debit, percentage: 15)
            currntAmount = transactionDetails.debit - gstAmount
        }else {
            self.totalAmount.textColor = .green
            self.totalAmount.text = "Total Amount: \(Utility.makeCurrencyFormatter(currentAmount: transactionDetails.credit))"
            self.transactionType.text = "Transaction Type : CREDIT"
            //gstAmount = Utility.calculateGST(excludeGST: transactionDetails.credit, percentage: 15)
            self.gstLabel.isHidden = true
            self.amountLabel.isHidden = true
            //self.amountLabel.text = "Total Amount: \(Utility.makeCurrencyFormatter(currentAmount: transactionDetails.credit))"
            currntAmount = transactionDetails.credit - gstAmount
            self.transactionViewHeight.constant = 60
            self.totalAmountTopConstraint.constant = 20
        }
        
        self.gstLabel.text = "Inclusive of GST : \(Utility.makeCurrencyFormatter(currentAmount: gstAmount))"
        self.amountLabel.text = "Amount: \(Utility.makeCurrencyFormatter(currentAmount: currntAmount))"
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
