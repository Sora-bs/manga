//
//  ViewController.swift
//  Manga_app
//
//  Created by sora on 2019/07/13.
//  Copyright © 2019 sora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var views: UIImageView!
    var imageArray = [UIImage]()
    var time1 = Timer()
    var time2 = Timer()
    
    var countUp = 0
    var updateCount = 0
    
    @IBOutlet weak var runButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image0 = UIImage(named: "dash0.png")
        let image1 = UIImage(named: "dash1.png")
        let image2 = UIImage(named: "dash2.png")
        let image3 = UIImage(named: "dash3.png")
        let image4 = UIImage(named: "dash4.png")
        let image5 = UIImage(named: "dash5.png")
        
        imageArray = [image0!, image1!, image2!, image3!, image4!, image5!]
        views.image = UIImage(named: "dash0.png")
    }
    
    @IBAction func start(_ sender: Any) {
        
        runButton.isEnabled = false
        
        time1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {(time1)in
            self.countUp += 1
            self.countLabel.text = String(self.countUp)
        })
        
        time2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {(time2)in
            
            if(self.updateCount >= 5){
                self.updateCount = 0
                self.views.image = UIImage(named: "dash0.png")
                }else{
                    self.views.image = self.imageArray[self.updateCount]
                }
                self.updateCount += 1
        })
    }
    
    @IBAction func stop(_ sender: Any) {
        
        runButton.isEnabled = true
        
        time1.invalidate()
        time2.invalidate()
    }
    
}

