//
//  RequestViewController.swift
//  Vantis
//
//  Created by Roberto Eduardo Guzman Ruiz on 8/29/19.
//  Copyright © 2019 Roberto Eduardo Guzman Ruiz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RequestViewController: UIViewController {
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Accept": "application/json",
        //"Authorization": "Bearer " + defaults.string(forKey: "token")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func post(url: String, parameters: Parameters){
        
 
       
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
