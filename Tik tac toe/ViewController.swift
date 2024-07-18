//
//  ViewController.swift
//  Tik tac toe
//
//  Created by R81 on 21/04/23.
//

import UIKit




class playGame: UIViewController {

    @IBOutlet var buttons: UIButton!
   
    @IBOutlet weak var pg: UIProgressView!
    
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func buttonAction(_ sender: Any) {
     
        progress()
    }
    func progress() {
            var a : Float = 0.0
            self.pg.progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.050, repeats: true, block: { [self] _ in
                a += 0.03
                self.pg.progress = a
                if self.pg.progress == 1.0{
                    self.timer.invalidate()
                    self.pg.progress = 0.0
                    self.pgnaviget()
              
                }
            })
        }
//        func bt (){
//            buttons.layer.shadowColor = UIColor.gray.cgColor
//                    buttons.layer.shadowOffset = CGSize(width: 3, height: 3)
//
//        }
//
    func pgnaviget(){
        let a = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(a, animated: true)
        
    }
   
}


   

