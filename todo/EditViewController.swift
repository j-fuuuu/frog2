//
//  EditViewController.swift
//  todo
//
//  Created by 藤井玖光 on 2022/09/23.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    let realm = try! Realm()
    
    var todoList: Results<Memo>!
    var detaList: Results<Memo>!
    

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.todoList = realm.objects(Memo.self)
        self.detaList = realm.objects(Memo.self)
        
     // Do any additional setup after loading the view.
        
        let title: String = titleTextField.text!
        //let content: String = contentTextField.text!
        let content: String = contentTextView.text!
        
        let memo: Memo? = read()
    }
    
    func read() -> Memo? {
        return realm.objects(Memo.self).first
        
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
