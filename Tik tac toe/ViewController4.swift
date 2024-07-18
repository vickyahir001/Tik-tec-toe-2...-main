//
//  ViewController4.swift
//  Tik tac toe
//
//  Created by vivek katariya on 16/07/24.
//
import UIKit

class ViewController4: UIViewController {
    
    @IBOutlet weak var olb: UILabel!
    @IBOutlet weak var xlb: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var xScoreLabel: UILabel!
    @IBOutlet weak var oScoreLabel: UILabel!
    
    var a : Int = 0
    var b : Int = 0
    var boarder = [String]()
    var currentPlayer = ""
    var values = [[0,1,2],[3,4,5],[6,7,8],
                  [0,3,6],[1,4,7],[2,5,8],
                  [0,4,8],[2,4,6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        board()
        buttonSetup()
        lableSetup()
        
        // Start the game with the player as the first move
        currentPlayer = "X" // Assuming "X" starts first
    }
    
    @IBAction func buttonsAction(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else { return }
        
        // Check if the cell is already occupied
        if !boarder[index].isEmpty {
            return
        }
        
        // Player's move
        sender.setTitle("X", for: .normal)
        boarder[index] = "X"
        sender.backgroundColor = UIColor(red: 198/255, green:27/255, blue:68/255, alpha: 2)
        
        // Check for game result after player's move
        checkGameResult()
        
        // Computer's move
        if !boardFull() { // Check if board is full before making a move
            computerMove()
        }
    }
    
    func scoreB() {
        b = b + 1
        oScoreLabel.text = b.description
    }
    func scoreA() {
        a = a + 1
        xScoreLabel.text = a.description
    }
    
    func computerMove() {
        var emptyIndices = [Int]()
        
        // Collect all empty indices
        for (index, value) in boarder.enumerated() {
            if value.isEmpty {
                emptyIndices.append(index)
            }
        }
        
        // Choose a random index from empty indices
        guard let randomIndex = emptyIndices.randomElement() else { return }
        
        // Computer's move
        buttons[randomIndex].setTitle("O", for: .normal)
        boarder[randomIndex] = "O"
        buttons[randomIndex].backgroundColor = UIColor(red: 43/255, green: 89/255, blue: 255/255, alpha: 2)
        
        // Check for game result after computer's move
        checkGameResult()
    }
    
    func checkGameResult() {
        for valueSet in values {
            let player0 = boarder[valueSet[0]]
            let player1 = boarder[valueSet[1]]
            let player2 = boarder[valueSet[2]]
            
            if player0 == player1, player1 == player2, !player2.isEmpty {
                showalert(title: "\(player2) wins! 🎉")
                clearColor()
                if player2 == "X" {
                    scoreA()
                }
                else
                {
                    scoreB()
                }
                return
            }
        }
        
        if boardFull() {
            showalert(title: "It's a tie! 😐")
            clearColor()
        }
    }
    
    func boardFull() -> Bool {
        return !boarder.contains("")
    }
    
    func reload() {
        boarder.removeAll()
        board()
        for button in buttons {
            button.setTitle(nil, for: .normal)
        }
        
    }
    
    func showalert(title: String) {
        let alert = UIAlertController(title: "", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { _ in
            self.reload()
            
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func board() {
        for _ in 0..<buttons.count {
            boarder.append("")
        }
    }
    
    func buttonSetup() {
        for button in buttons {
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowOpacity = 3
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.cornerRadius = 35
        }
    }
    
    func clearColor() {
        for button in buttons {
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    func lableSetup() {
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
