//
//  ViewController2.swift
//  Navigation Demo
//
//  Created by Mohamed Khaled on 24/10/2022.
//

import UIKit
protocol imageDelgate{
    func didTappedOnImage(_ image : UIImage)
}
class ViewController2: UIViewController {
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    var delegate : imageDelgate?
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.image = UIImage(named:"image11")
        image2.image = UIImage(named: "image12")
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        image2.addGestureRecognizer(tapGR)
        image2.isUserInteractionEnabled = true
        let tapGR2 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        image1.addGestureRecognizer(tapGR2)
        image1.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
                if sender.state == .ended {
                    let storyboaed = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboaed.instantiateViewController(withIdentifier: "ViewController1") as! ViewController1
                    if sender.view?.tag == 1 {
                        vc.setImage = image1.image!
                        delegate?.didTappedOnImage(image1.image!)
                    }else{
                        vc.setImage = image2.image!
                        delegate?.didTappedOnImage(image2.image!)
                    }
                    navigationController?.popViewController(animated: true)
                }
        }
    @IBAction func sendTOThreebu(_ sender: UIButton) {
        let storyboaed = UIStoryboard(name: "Main", bundle: nil)
        let vc2 = storyboaed.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        vc2.text = "coming from second page"
        self.navigationController?.pushViewController(vc2, animated: true)
    }
}
