//
//  Reason.swift
//  ZHOUYI
//
//  Created by Apple on 2018/12/11.
//  Copyright © 2018 FENGYX. All rights reserved.
//

import UIKit
import ToastSwiftFramework

class Reason: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // 控件
    @IBOutlet weak var pickDateButton: UIButton!
    @IBOutlet weak var pickYongShenButton: UIButton!
    @IBOutlet weak var ReasonTextField: UITextField!
    // 控件功能
    @IBAction func onPickDate(_ sender: Any) {
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 270, height: 200))
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.datePickerMode = UIDatePicker.Mode.date
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let YAction = UIAlertAction(title: "确定", style: .default, handler: { action in
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            self.Date = dateFormat.string(from: datePicker.date)
            self.pickDateButton.setTitle(self.Date, for: UIControl.State.normal)
        })
        let NAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.view.addSubview(datePicker)
        alert.addAction(YAction)
        alert.addAction(NAction)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func onPickYongShen(_ sender: Any) {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let YAction = UIAlertAction(title: "确定", style: .default, handler: { action in
            self.YongShen = self.YongShenList[self.YongShenPickerView.selectedRow(inComponent: 0)]
            self.pickYongShenButton.setTitle(self.YongShen, for: UIControl.State.normal)
        })
        let NAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.view.addSubview(YongShenPickerView)
        alert.addAction(YAction)
        alert.addAction(NAction)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func toGuaXiang(_ sender: Any) {
        Reason = ReasonTextField.text ?? ""
        if Date != "" && YongShen != "" {
            performSegue(withIdentifier: "ToGuaXiang", sender: nil)
        } else {
            self.view.makeToast("卜卦日期或卜卦用神未选择!")
        }
    }
    
    var Date: String = ""
    var YongShen: String = ""
    var Reason: String = ""
    
    var YongShenPickerView: UIPickerView!
    var YongShenList = ["父母", "兄弟", "官鬼", "子孙", "妻财", "世", "应"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        YongShenPickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 270, height: 200))
        YongShenPickerView.delegate = self
        YongShenPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    // 设置pickerview的列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return YongShenList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return YongShenList[row]
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ToGuaXiang" {
            let GuaXiang = segue.destination as! GuaXiang
            GuaXiang.Date = Date
            GuaXiang.YongShen = YongShen
            GuaXiang.Reason = Reason
        }
    }

}
