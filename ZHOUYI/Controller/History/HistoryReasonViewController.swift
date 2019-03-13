//
//  HistoryReasonViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/3/13.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class HistoryReasonViewController: UIViewController {
    
    // 控件
    @IBOutlet weak var BenGuaImageView: UIImageView!
    @IBOutlet weak var BianGuaImageView: UIImageView!
    @IBOutlet weak var BenGuaLabel: UILabel!
    @IBOutlet weak var BianGuaLabel: UILabel!
    @IBOutlet weak var MethodLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var YongShenLabel: UILabel!
    @IBOutlet weak var ReasonLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NoteLabel: UILabel!
    
    var gua: Gua?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DateLabel.layer.masksToBounds = true
        DateLabel.layer.cornerRadius = 5
        YongShenLabel.layer.masksToBounds = true
        YongShenLabel.layer.cornerRadius = 5
        ReasonLabel.layer.masksToBounds = true
        ReasonLabel.layer.cornerRadius = 5
        NameLabel.layer.masksToBounds = true
        NameLabel.layer.cornerRadius = 5
        NoteLabel.layer.masksToBounds = true
        NoteLabel.layer.cornerRadius = 5
        
        switch gua?.method {
        case "LiuYao":
            MethodLabel.text = "六爻"
        case "ShuZi":
            MethodLabel.text = "数字"
        case "ZiDing":
            MethodLabel.text = "自定"
        default:
            break
        }
        DateLabel.text = gua?.date
        YongShenLabel.text = gua?.yongShen
        ReasonLabel.text = gua?.reason
        NameLabel.text = gua?.name
        NoteLabel.text = gua?.note
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "HistoryReasonToResult" {
            let destination = segue.destination as! ResultViewController
            destination.gua = gua
        }
    }
    

}
