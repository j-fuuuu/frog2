//
//  AddViewController.swift
//  todo
//
//  Created by 藤井玖光 on 2022/09/06.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    let realm = try! Realm()
    var datePicker: UIDatePicker = UIDatePicker()
    
    @IBOutlet weak var titleTextField: UITextField!
    //@IBOutlet var contentTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
        //contentTextField.delegate = self
        contentTextView.delegate = self
        
        //日付を入れるところの枠の設定
        titleTextField.layer.borderColor = UIColor.gray.cgColor
        
        titleTextField.layer.borderWidth = 1.0
        
        //内容を書くところの枠の設定
        contentTextView.layer.borderColor = UIColor.gray.cgColor
        
        contentTextView.layer.borderWidth = 1.0
        
        // ピッカー設定
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        titleTextField.inputView = datePicker
                
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
                
        // インプットビュー設定
        titleTextField.inputView = datePicker
        titleTextField.inputAccessoryView = toolbar
        
        datePicker.preferredDatePickerStyle = .wheels
    }
    
    
    // 決定ボタン押下
        @objc func done() {
            titleTextField.endEditing(true)
            
            // 日付のフォーマット
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            titleTextField.text = "\(formatter.string(from: datePicker.date))"
        }
        
        // Do any additional setup after loading the view.


    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }
        
    @IBAction func saveBotton(){
        let title: String = titleTextField.text!
        //let content: String = contentTextField.text!
        let content: String = contentTextView.text!
       
        let newMemo = Memo()
            newMemo.title = title
            newMemo.content = content
            //newMemo.date = date
        
            try! realm.write{
                realm.add(newMemo)
            }
        
        //アラートを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        //アラートのボタンを作る
        alert.addAction(
                    UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: { action in
                            self.navigationController?.popViewController(animated: true)
                        }
                )
        )
        present(alert, animated: true, completion: nil)
        
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
