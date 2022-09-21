//
//  homeViewController.swift
//  todo
//
//  Created by 藤井玖光 on 2022/09/21.
//

import UIKit
import RealmSwift

class homeViewController: UIViewController {
    
    let realm = try! Realm()
    
    //レベルを表示するラベル
    @IBOutlet var LevelLabel: UILabel!
    
    //キャラクターを表示するimageview
    @IBOutlet var CharacterImageView: UIImageView!
    
    //レベル数を入れる箱
    var Levelnumber = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //振り返るボタン
    @IBAction func FrogBotton() {
        
        Levelnumber = Levelnumber + 1
        LevelLabel.text = String(Levelnumber)
        
        if Levelnumber == 3{
            CharacterImageView.image = UIImage(named: "frog1")
            
        }
        
        if Levelnumber == 7{
            CharacterImageView.image = UIImage(named: "frog2")
            
        }
        
        if Levelnumber == 14{
            CharacterImageView.image = UIImage(named: "frog3")
            
        }
        
        if Levelnumber == 30{
            CharacterImageView.image = UIImage(named: "frog4")
            
        }
        
        let data = Grow()
        data.level =  LevelLabel.text!
        
        try! realm.write {
            realm.Grow()
            
        }
        
        
    }
}
