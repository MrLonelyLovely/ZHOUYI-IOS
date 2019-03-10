//
//  YiViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/3/10.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class YiViewController: UIViewController {
    
    
    @IBAction func ClickOper1Button(_ sender: Any) {
        gua?.method = "LiuYao"
        self.performSegue(withIdentifier: "YiToOper1Reason", sender: nil)
    }
    @IBAction func ClickOper2Button(_ sender: Any) {
        gua?.method = "ShuZi"
        self.performSegue(withIdentifier: "YiToOper1Reason", sender: nil)
    }
    @IBAction func ClickOper4Button(_ sender: Any) {
        gua?.method = "ZiDing"
        self.performSegue(withIdentifier: "YiToOper1Reason", sender: nil)
    }
    
    var gua: Gua? = Gua()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "YiToOper1Reason" {
            let destination = segue.destination as! Oper1ReasonViewController
            destination.gua = gua
        }
    }
    

}
