//
//  ResultViewController.swift
//  Calc
//
//  Created by 呼元祐樹 on 2023/07/12.
//

import UIKit

class ResultViewController: UIViewController {

    var point = 0
    @IBOutlet weak var recordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recordLabel.text = "あなたの記録\(point)P"
    }
    
    @IBAction func onBackTop(_ sender: Any) {
        navigationController?
            .popToRootViewController(animated: true)
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
