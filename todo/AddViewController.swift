//
//  AddViewController.swift
//  todo
//
//  Created by 藤井玖光 on 2022/09/06.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let memo: Memo? = read()
        
        titleTextField.text = memo?.title
        contentTextView.text = memo?.content

        // Do any additional setup after loading the view.
    }
    func read() -> Memo?{
        return realm.objects(Memo.self).first
    }
        
    @IBAction func saveBotton(){
        let title: String = titleTextField.text!
        let content: String = contentTextView.text!
        
        let memo: Memo? = read()
        
        if memo != nil{
            try! realm.write{
                memo!.title = title
                memo!.content = content
            }
        }else{
            let newMemo = Memo()
            newMemo.title = title
            newMemo.content = content
            
            try! realm.write{
                realm.add(newMemo)
            }
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
