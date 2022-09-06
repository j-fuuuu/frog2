//
//  ViewController.swift
//  todo
//
//  Created by 藤井玖光 on 2022/09/06.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    //storyboardで使うtable viewを宣言
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //table viewのデータソースはview controllerに書くという宣言
        table.dataSource = self
    }

    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    //ID付きのセルを取得してセルフ族のtextLabelにテストと表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "テスト"
        
        return cell!
    }
}
