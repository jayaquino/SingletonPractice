//
//  ViewController.swift
//  SingletonPractice
//
//  Created by Nelson Aquino Jr  on 4/19/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var makemodelLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
    @IBOutlet weak var drivetypeLabel: UILabel!
    
    let apiManager = APIManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.load(urlString: "https://random-data-api.com/api/vehicle/random_vehicle") { model in
            
            DispatchQueue.main.async {
                self.makemodelLabel.text = model.make_and_model
                self.colorLabel.text = model.color
                self.transmissionLabel.text = model.transmission
                self.drivetypeLabel.text = model.drive_type
            }
        }
    }


}

