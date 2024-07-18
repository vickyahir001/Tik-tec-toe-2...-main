//
//  ViewController.swift
//  demo game
//
//  Created by R81 on 21/04/23.
//


import UIKit

class ViewController3 : UIViewController {

    @IBOutlet weak var olb: UILabel!
    @IBOutlet weak var xlb: UILabel!
    @IBOutlet var buttons: [UIButton]!
      @IBOutlet weak var xScoreLabel: UILabel!
      @IBOutlet weak var oScoreLabel: UILabel!
      var a : Int = 0
      var b : Int = 0
      var boarder = [String]()
      var currentPlayer = ""
      var score = 0
      var values = [[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],
                    [0,4,8],[2,4,6]]
      override func viewDidLoad() {
          super.viewDidLoad()
          board()
          value()
         buttonSetup()
          lableSetup()
      }
      @IBAction func buttonsAction(_ sender: UIButton) {
     let button = sender
     let index = buttons.lastIndex(of: sender)!
     if !boarder[index].isEmpty
          {
         return
     }
          if currentPlayer == "O"
          {
              sender.setTitle("O", for: .normal)
              currentPlayer = "X"
              boarder[index] = "O"
              button.backgroundColor = UIColor(red: 198/255, green:27/255, blue:68/255, alpha: 2)
          }
          else
          {
              sender.setTitle("X", for: .normal)
              currentPlayer = "O"
              boarder[index] = "X"
              button.backgroundColor = UIColor(red: 43/255, green: 89/255, blue: 255/255, alpha: 2)
          }
          value()
      }
    func scoreB() {
        b = b + 1
        oScoreLabel.text = b.description
    }
    func scoreA() {
        a = a + 1
        xScoreLabel.text = a.description
    }
      func value()
      {
          for j in values
          {
              let player0 = boarder[j[0]]
              let player1 = boarder[j[1]]
              let player2 = boarder[j[2]]
              print("P0\(player0)   p1\(player1)  p2\(player2)")
              if player0 == player1,
                 player1 == player2,
                 !player2.isEmpty
                   
              {
                  reload()
                  if player2 == "X" {
                      scoreA()
                  }
                  else
                  {
                      scoreB()
                  }
                  showalert(title: "Awasom win is \(player2)!🥳")
                  currentPlayer = "X"
                  clearColor()
              }
              else if !boarder.contains("")
             {
                 showalert(title: "its tie😐")
                 clearColor()
             }
          }
      }
      func reload()
      {
          boarder.removeAll()
          board()
          for k in buttons
          {
              k.setTitle(nil, for: .normal)
          }
      }
      func showalert(title:String)
      {
          let alert = UIAlertController(title: "", message: title, preferredStyle: .alert)
          alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { _ in
          self.reload()
          }))
          present(alert, animated: true, completion: nil)
      }
      func board()
      {
          for _ in 0..<buttons.count
          {
              boarder.append("")
          }
      }
    func buttonSetup () {
        for button in buttons {
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowOpacity = 3
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.cornerRadius = 35
        }
      }
      func clearColor (){
          for button in buttons {
              button.layer.backgroundColor = UIColor.lightGray.cgColor
          }
          
      }
    func lableSetup(){
        xScoreLabel.layer.shadowColor = UIColor.gray.cgColor
        xScoreLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        xScoreLabel.layer.shadowOpacity = 10
        oScoreLabel.layer.shadowColor = UIColor.gray.cgColor
        oScoreLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        oScoreLabel.layer.shadowOpacity = 10
        xlb.layer.shadowColor = UIColor.gray.cgColor
        xlb.layer.shadowOffset = CGSize(width: 5, height: 5)
        xlb.layer.shadowOpacity = 10
        olb.layer.shadowColor = UIColor.gray.cgColor
        olb.layer.shadowOffset = CGSize(width: 5, height: 5)
       olb.layer.shadowOpacity = 10
    }
  }
