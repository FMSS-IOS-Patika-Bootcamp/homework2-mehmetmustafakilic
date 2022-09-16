//
//  SecondViewController.swift
//  bootcampOdev2
//
//  Created by Mehmet Mustafa Kılıç on 15.09.2022.
//

import UIKit


class SecondViewController: UIViewController {

    var secondLabelText: String?
    var secondImageView: UIImage?
    
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondLabel.text = secondLabelText
        secondImage.image = secondImageView
        // Do any additional setup after loading the view.
    }
    

    @IBAction func moreDetail(_ sender: Any) {
        print("dfgds")
        
        let webVC = WebViewController()
        present(webVC, animated: true)
    }
}
