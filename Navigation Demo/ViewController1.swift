//
//  ViewController.swift
//  Navigation Demo
//
//  Created by Mohamed Khaled on 23/10/2022.
//

import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var HomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:#selector(doYouBack(_:)), name: NSNotification.Name("labeltext"), object: nil)
    }
    
    @objc func doYouBack(_ notification: Notification){
        let text = notification.userInfo!["text"] as! String
        HomeLabel.text = text
    }
    
    @IBAction func homeButton(_ sender: UIButton) {
        let storyboaed = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboaed.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
// MARK: - Image Delegate methods
//
extension ViewController1: ImageDelgate {
    func didTappedOnImage(_ image: UIImage) {
        homeImage.image = image
    }
}
