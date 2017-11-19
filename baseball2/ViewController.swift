// 스트라이크 맞추면, 화면 전환?!

import UIKit

class ViewController: UIViewController {

    let NUMBERS: Int = 3

    var answer: [Int] = []
    var guessTemp: [Int] = []
    
    
    func makeAnswerNumber(_ numbers: Int) -> [Int] {
        var temp = [Int]()
        
        while temp.count < numbers {
            let randomNumber = Int(arc4random_uniform(10))
            if !temp.contains(randomNumber) {
                temp.append(randomNumber)
            }
        }
        
        return temp
    }
    
    @IBOutlet weak var guessLabel: UILabel!
    
    @IBAction func numberButton(_ sender: UIButton) {
        
        let input: Int = sender.tag
        
        if guessTemp.count < NUMBERS && !guessTemp.contains(input) {
            guessTemp.append(input)
            guessLabel.text = changeArrayToString(a: guessTemp)
        }
        print(guessTemp)
    }
    
    func changeArrayToString(a: [Int]) -> String {
        var b: String = ""
        for i in 0..<a.count {
           b = b + String(a[i])
        }
        return b
    }
    
    @IBAction func xButton(_ sender: UIButton) {
        guessTemp.removeLast()
        guessLabel.text = changeArrayToString(a: guessTemp)
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        
        var strike: Int = 0
        var ball: Int = 0
        var out: Int = 0
        
        func compareAnswerGuess() {
            for (n, c) in answer.enumerated() {
                if c == guessTemp[n] {
                    strike = strike + 1
                } else if guessTemp.contains(c) == true {
                    ball += 1
                } else {
                    out += 1
                }
            }
            compareLabel.text = "S: \(strike)/ B: \(ball)/ O: \(out)"
        }
        
        compareAnswerGuess()
        
        func clearGuessTemp() { //answer와 guess비교 후, guessTemp & guesslabel를 없앰.
            guessTemp = []
            guessLabel.text = ""
        }
        
        clearGuessTemp()

    }
    
    
    

    @IBOutlet weak var compareLabel: UILabel!
    
    
    
    
    
    @IBAction func startButton(_ sender: UIButton) {
        answer = makeAnswerNumber(NUMBERS)
        print(answer)
    
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

