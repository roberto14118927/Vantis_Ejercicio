//
//  TableViewController.swift
//  Vantis
//
//  Created by Roberto Eduardo Guzman Ruiz on 8/29/19.
//  Copyright © 2019 Roberto Eduardo Guzman Ruiz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    var name = [String]()
    var esPadre = [Int]()
    var idModulo = [Int]()
    var datas : JSON = []
    var sub = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        renderTable(data: datas)
    }
    
    func renderTable(data: JSON){
        let swiftyJsonResults = data.arrayValue
        for result in swiftyJsonResults {
            let descripcion = result["descripcion"].stringValue
            let esPadrec = result["esPadre"].intValue
            let idModuloc = result["idModulo"].intValue
            if esPadrec != 0 {
                self.name.append(descripcion)
                self.esPadre.append(esPadrec)
                self.idModulo.append(idModuloc)
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return name.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableViewCell", for: indexPath) as! CellTableViewCell
        cell.nameLbl.text = self.name[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //showAlert(title: "Tabla", message: self.name[indexPath.row])
        let idData = self.idModulo[indexPath.row]
        //showAlert(title: "Submenu", message: String(idData) )
        self.sub = ""
        self.sub.append("")
        let swiftyJsonResults2 = datas.arrayValue
        for result in swiftyJsonResults2 {
            let descripcion = result["descripcion"].stringValue
            let padre = result["padre"].intValue
            if padre ==  idData {
                self.sub.append(descripcion)
                self.sub.append(",")
            }
        }
        showAlert(title: "Submenu", message: self.sub )

    }
    
    func showAlert(title: String, message: String){
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }

}
