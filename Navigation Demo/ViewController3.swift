//
//  ViewController3.swift
//  Navigation Demo
//
//  Created by Mohamed Khaled on 24/10/2022.
//

import UIKit
//protocol Delegate : AnyObject {
//    func didTappedonButton(title:String)
//}
class ViewController3: UIViewController {
    @IBOutlet weak var myQuote: UILabel!
    var text = " "
//    var delegate : Delegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        myQuote.text = text
        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendToFristButt(_ sender: UIButton) {
        let userInfo = ["text" : myQuote.text]
        NotificationCenter.default.post(name: NSNotification.Name("labeltext"), object: nil,userInfo: userInfo)
//        let title = myQuote.text ?? ""
//        delegate?.didTappedonButton(title: title)
        filterAlert ()
    }
    func filterAlert () {
        let alertController = UIAlertController(title: "Confirm", message: "are you sure to use filter", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
            let storyboaed = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboaed.instantiateViewController(withIdentifier: "ViewController1") as! ViewController1
            vc.homeText = self.myQuote.text ?? " "
            self.navigationController?.popToRootViewController(animated: true)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
                UIAlertAction in
            self.dismiss(animated: true)
            }

            // Add the actions
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }

}
//extension ViewController3 : Delegate{
//    func didTappedonButton(title: String) {
//      
//    }
//}
