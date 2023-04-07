//
//  ViewController.swift
//  fmdbDatabase
//
//  Created by R & W on 04/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var T1: UITextField!
    @IBOutlet weak var T2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fmdbHelper.createFile()
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        if let x = T1.text , let y = Int(x){
            fmdbHelper.addData(id: y , name: T2.text!)
        }
        
    }
    
    @IBAction func DELETBUTTONACTION(_ sender: Any) {
        if let x = T1.text,let y = Int(x){
            fmdbHelper.deleteData(id: y , name: T2.text!)
        }
    }
    @IBAction func addDataAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigation, animated: true)
        
    }
    
}

