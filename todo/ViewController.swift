//
//  ViewController.swift
//  todo
//
//  Created by 藤井玖光 on 2022/09/06.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //storyboardで使うtable viewを宣言
    @IBOutlet var table: UITableView!
    
    let realm = try! Realm()
    
    var todoList: Results<Memo>!
    var detaList: Results<Memo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //table viewのデータソースはview controllerに書くという宣言
        table.dataSource = self
        table.delegate = self
        
        self.todoList = realm.objects(Memo.self)
        self.detaList = realm.objects(Memo.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let realm = try! Realm()
        let contentresults = realm.objects(Memo.self)
        table.reloadData()
        print(todoList.count)
    }

    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoList.count
    }
    
    //ID付きのセルを取得してセルフ族のtextLabelにテストと表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let memo: Memo = self.todoList[indexPath.row]
        cell?.textLabel?.text = memo.title
        return cell!
    }
    
    //削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! realm.write {
                let item = todoList[indexPath.row]
                realm.delete(item)
                }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
            try! realm.write {
                let listItem = todoList[fromIndexPath.row]
                todoList.remove(at: fromIndexPath.row)
                todoList.insert(listItem, at: to.row)
            }
        }
        func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        
    }
    extension List {
        subscript (save index: Int) -> Element? {
            if index < self.count {
                return self[index]
            } else {
                return nil
            }
        }
    }
