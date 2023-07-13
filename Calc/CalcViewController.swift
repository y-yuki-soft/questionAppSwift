//
//  CalcViewController.swift
//  Calc
//
//  Created by 呼元祐樹 on 2023/07/12.
//

import UIKit
import AVFoundation

class CalcViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var qestionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var answer = 0
    var point = 0
    var time = 20
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        makeNewQuestion()
        setButtonTitle()
        
        button1.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        button4.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        

    }
    
    @objc func onButton(_ sender:UIButton){
        let input = Int(sender.currentTitle!)
        if input == answer{
            point  += 10
            resultLabel.text = "前回の問題　：　正解"
            playSound(name: "corect")
        }else{
            point -= 10
            resultLabel.text = "前回の問題　：　不正解"
            playSound(name: "incorect")
        }
        makeNewQuestion()
        setButtonTitle()
    }
    
    @objc func countTime(){
        time -= 1
        timeLabel.text = "残り\(time)秒です"
        if time == 0{
            timer?.invalidate()
            performSegue(withIdentifier: "result", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! ResultViewController
        nextVC.point = point

        
    }
    
    func makeNewQuestion(){
        let num1 = Int.random(in: 0...9)
        let num2 = Int.random(in: 0...9)
        qestionLabel.text = "\(num1) + \(num2) ="
        answer = num1 + num2
    }
    
    func setButtonTitle(){
        var answerList =  [answer]
        while answerList.count < 4 {
            let randomAnswer = Int.random(in: 0...18)
            if !answerList.contains(randomAnswer){
                answerList.append(randomAnswer)
            }
        }
        answerList.shuffle()
        button1.setTitle(String(answerList[0]), for: .normal)
        button2.setTitle(String(answerList[1]), for: .normal)
        button3.setTitle(String(answerList[2]), for: .normal)
        button4.setTitle(String(answerList[3]), for: .normal)
    }
    
    var player:AVAudioPlayer?
    
    func playSound(name:String){
        let path = Bundle.main.bundleURL.appendingPathComponent(name+".mp3")
        do{
            player = try AVAudioPlayer(contentsOf: path,fileTypeHint: nil)
            player?.play()
        }catch{
            print("error")
        }
        
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
