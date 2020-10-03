//
//  ViewController.swift
//  AlamofireExample
//
//  Created by Ruken SANCAR on 3.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postDeneme()
    }
    
    private func postDeneme() {
        
        let parametreler: [String: Any] = [ "id": 1,
                                            "name": "Adı",
                                            "surname": "Soyadı"]
        Services.sharedInstance.postDataToWebServiceWithVariables(urlExtra: Constant.postdeneme, parameters: parametreler)
    }
}
