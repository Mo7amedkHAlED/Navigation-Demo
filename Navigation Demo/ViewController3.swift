//
//  ViewController3.swift
//  Navigation Demo
//
//  Created by Mohamed Khaled on 24/10/2022.
//

import UIKit

class ViewController3: UIViewController {
    @IBOutlet weak var myQuote: UILabel!
    var text = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myQuote.text = text
    }
    
    
    @IBAction func sendToFristButt(_ sender: UIButton) {
        configureConfirmationAlert ()
    }
    
    func configureConfirmationAlert () {
        let alertController = UIAlertController(title: "Confirm", message: "Are you sure U want to navigate back?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            _ in
            let userInfo = ["text" : self.myQuote.text]
            NotificationCenter.default.post(name: NSNotification.Name("labeltext"), object: nil, userInfo: userInfo as [AnyHashable : Any])
            self.navigationController?.popToRootViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        present(alertController, animated: true, completion: nil)
    }
    
}
