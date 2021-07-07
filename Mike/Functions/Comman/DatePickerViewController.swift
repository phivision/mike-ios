//
//  DatePickerViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/31.
//

import UIKit
@objc protocol DatePickerViewControllerDelegate{
    @objc func doneBtnClicked(timeValue:String)
}
class DatePickerViewController: BaseViewController {
    @IBOutlet weak var datePicker:UIPickerView!
    weak var delegate:DatePickerViewControllerDelegate?
    var firstIndex:NSInteger = 0
    var secondIndex:NSInteger = 0
    var thirdIndex:NSInteger = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.configDatePicker()
        // Do any additional setup after loading the view.
    }

    func configDatePicker(){
        self.datePicker.delegate = self
        self.datePicker.dataSource = self
        self.datePicker.selectRow(self.firstIndex, inComponent: 0, animated: false)
        self.datePicker.selectRow(self.secondIndex, inComponent: 1, animated: false)
        self.datePicker.selectRow(self.thirdIndex, inComponent: 2, animated: false)
    }
    @IBAction func dismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func sureBtnClicked(){
        let finalTime = String(format: "%02d:%02d:%02d", self.firstIndex,self.secondIndex,self.thirdIndex)
        self.delegate?.doneBtnClicked(timeValue: finalTime)
        self.dismiss(animated: true, completion: nil)
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
extension DatePickerViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1:
            return 60
        case 2:
            return 60
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let itemWidth:CGFloat = CGFloat(kScreenWidth/3.0)
        let title = UILabel(frame: CGRect(x: itemWidth*CGFloat(component), y: 0, width: itemWidth, height: 50))
        title.textColor = defaultTitleColor
        title.font = UIFont.systemFont(ofSize: 15)
        title.text = "\(row)"
        title.textAlignment = .center
        return title
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            self.firstIndex = row
            break
        case 1:
            self.secondIndex = row
            break
        case 2:
            self.thirdIndex = row
            break
        default:
            break
        }
    }
}
