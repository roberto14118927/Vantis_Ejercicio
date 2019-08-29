//
//  LoginViewController.swift
//  Vantis
//
//  Created by Roberto Eduardo Guzman Ruiz on 8/29/19.
//  Copyright © 2019 Roberto Eduardo Guzman Ruiz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    @IBOutlet var txtUser: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    let defaults = UserDefaults.standard
    
    var datas : JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func loginBtn(_ sender: Any) {
            if self.txtUser.text! == "" || self.txtPassword.text! == "" {
               self.showAlert(title: "Alerta", message: "Alguno de los campos esta Vacio")
            }
            else {
                let url = "http://35.236.88.26:8035/api/Login/Authentication"
                
                let headers: HTTPHeaders = [
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                ]
                
                var parameters:Parameters = [String : Any]()
                parameters["correo"] = self.txtUser.text!
                parameters["contrasena"] = self.txtPassword.text!
                
                let manager = Alamofire.SessionManager.default
                manager.session.configuration.timeoutIntervalForRequest = 15
                
                manager.request(url, method: .post, parameters: parameters , encoding: JSONEncoding.default, headers: headers)
                    .responseJSON { (response) in
                        switch response.result {
                        case .success(let value):
                            let status = (response.response?.statusCode)!
                            let swiftyJson = JSON(value)
                            if status == 200 {
                                let swiftyJsonResults = swiftyJson["dtoUser"]
                        
                                if swiftyJsonResults != JSON.null {
                                    let Storyboard = UIStoryboard(name:"Main", bundle: nil)
                                    let DvC =  Storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
                                    print(swiftyJson["modules"])
                                     DvC.datas = swiftyJson["modules"]
                                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                    appDelegate.window?.rootViewController = DvC
                                }else {
                                    self.showAlert(title: "Alerta", message: swiftyJson["message"].stringValue)
                                }
                                
                            }
                        case .failure(let error):
                            if error._code == NSURLErrorTimedOut {
                                self.showAlert(title: "Alerta", message: "El servicio se encuentra inactivo por el momento")
                            }
                        }
            }
        }
    }
    
    func showAlert(title: String, message: String){
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
}
