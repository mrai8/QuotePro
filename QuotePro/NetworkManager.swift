//
//  NetworkManager.swift
//  QuotePro
//
//  Created by Mandeep on 2017-06-12.
//  Copyright © 2017 Mandeep. All rights reserved.
//


import UIKit
import Foundation

/*
 
 {
 "quoteText":"What you are is what you have been. What youâ€™ll be is what you do now.",
 "quoteAuthor":"Buddha", 
 "senderName":"", 
 "senderLink":"", 
 "quoteLink":"http://forismatic.com/en/b6c68d5050/"
 }
 */


class NetworkManager {
    
    
    static func fetchQuote(completion:@escaping (Data)->()) {
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        
        let session = URLSession.shared
        
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            // check for an error and exit if you have one
            
            if let error = error {
                print(#line, error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print(#line, "not a 200")
                return
            }
            
            
            
            guard let data = data else {
                print(#line, "no data")
                return
            }
            
            
            // JSON conversion
            
            print(#line, data)
            completion(data)
            
        }
        task.resume()
}
    
    
    static func fetchPhoto(completion:@escaping (Data)->()) {
        let url = URL(string: "http://lorempixel.com/200/300/")
        
        let session = URLSession.shared
        
        let request = URLRequest(url: url!)
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            
            if let error = error {
                print(#line, error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print(#line, "not a 200")
                return
            }
            
            
            
            guard let data = data else {
                print(#line, "no data")
                return
            }
            
            print(#line, data)
            completion(data)
            
        }
            task.resume()
    }
    
    
    


    
    
    
    
}
