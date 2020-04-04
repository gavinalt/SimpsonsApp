//
//  DetailViewController.swift
//  TheSimpsons
//
//  Created by Gavin Li on 4/3/20.
//  Copyright © 2020 Gavin Li. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var charDesc: UILabel!
    @IBOutlet weak var charImg: UIImageView!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let nameLbl = charName {
                nameLbl.text = detail.getFullName()
            }
            if let descLbl = charDesc {
                descLbl.text = detail.getDescription()
            }
            if let imgIV = charImg {
                CharacterProfile.getImageFromWeb(detail.Icon.URL) { (dlImg) in
                    if let image = dlImg {
                        imgIV.image = image
                    } else { // if you use an Else statement, it will be in background
                        imgIV.image = UIImage(named: "placeholder")
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: CharacterProfile? {
        didSet {
            // Update the view.
            configureView()
        }
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
