//
//  DetailViewController.swift
//  QuotePro
//
//  Created by Mandeep on 2017-06-12.
//  Copyright © 2017 Mandeep. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var qp:QPObject?
    
    @IBOutlet weak var dvcImageView: UIImageView!
    
    
    @IBOutlet weak var dvcLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dvcLabel.text = qp?.quote
        dvcImageView.image = qp?.photo

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
