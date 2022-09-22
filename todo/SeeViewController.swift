//
//  SeeViewController.swift
//  todo
//
//  Created by 藤井玖光 on 2022/09/22.
//

import UIKit
import RealmSwift

class SeeViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    

    @IBOutlet weak var titleTextField: UITextField!
    //@IBOutlet var contentTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
