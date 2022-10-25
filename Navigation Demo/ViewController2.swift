//
//  ViewController2.swift
//  Navigation Demo
//
//  Created by Mohamed Khaled on 24/10/2022.
//

import UIKit
protocol ImageDelgate {
    func didTappedOnImage(_ image : UIImage)
}

class ViewController2: UIViewController {
    
    /// IBOutlets
    ///
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    var delegate : ImageDelgate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.image = UIImage(named:"image11")
        image2.image = UIImage(named: "image12")
        
        addTargetForImage(image: image1, action: #selector(imageTapped))
        addTargetForImage(image: image2, action: #selector(imageTapped))
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.view?.tag == 1 {
            guard let image = image1.image else { return }
            delegate?.didTappedOnImage(image)
        } else {
            guard let image = image2.image else { return }
            delegate?.didTappedOnImage(image)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendTOThreebu(_ sender: UIButton) {
        let storyboaed = UIStoryboard(name: "Main", bundle: nil)
        let vc2 = storyboaed.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        vc2.text = "coming from second page"
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    func addTargetForImage(image: UIImageView, action: Selector) {
        let tapGR = UITapGestureRecognizer(target: self, action: action)
        image.addGestureRecognizer(tapGR)
    }
}
