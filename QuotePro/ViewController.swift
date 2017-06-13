//
//  ViewController.swift
//  QuotePro
//
//  Created by Mandeep on 2017-06-12.
//  Copyright © 2017 Mandeep. All rights reserved.
//

import UIKit

protocol saveDelegate {
    func saveQP(qp:QPObject)
}

class ViewController: UIViewController {
    
    var delegate:saveDelegate?
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func newQuote(_ sender: UIButton) {
        
        fetchQuote()
        
    }
    
    @IBAction func newPhoto(_ sender: UIButton) {
        
        fetchPhoto()
        
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        
        let newQP = QPObject(quote: quoteLabel.text!, photo: imageView.image!)
        
        
        
        saveQP(qp: newQP!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchQuote()
        
        fetchPhoto()
        
        
        
        
    }
    
    func saveQP(qp:QPObject) {
        self.delegate?.saveQP(qp: qp)
    }
    
    // call fetchquote with the button tap
    
    // do the same thing for photos
    
    
    private func fetchQuote() {
        
        NetworkManager.fetchQuote{(data: Data) in
            
            var dict:Any?
                
            do {
                dict =  try JSONSerialization.jsonObject(with: data, options: [])
            } catch {
                print(#line, error.localizedDescription)
                return
            }
            
            guard let unwrappedDict = dict as? Dictionary<String,Any>, let quoteText = unwrappedDict["quoteText"] as? String else {
                print(#line, "something wrong")
                return
            }
            
            print(#line, quoteText)
            
            
            DispatchQueue.main.async {
                self.quoteLabel.text = quoteText
            }
            
//            let fakeLabel = UILabel()
//            DispatchQueue.main.async {
//                fakeLabel.text = quoteText
//            }
        }
    }
    
    private func fetchPhoto() {
        
        NetworkManager.fetchPhoto{(data:Data) in
            
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
    }
}
}
