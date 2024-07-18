//
//  ViewController2.swift
//  Tik tac toe
//
//  Created by R81 on 21/04/23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var towPlayerBt: UIButton!
    @IBOutlet weak var singalPlyerbt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func towPlayerBtAction(_ sender: Any) {
        
            let a = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
            navigationController?.pushViewController(a, animated: true)
        
    }
    
    
  
    @IBAction func onePlayerBtnAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController4") as! ViewController4
        
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
