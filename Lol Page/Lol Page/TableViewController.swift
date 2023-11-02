//
//  TableViewController.swift
//  Lol Page
//
//  Created by Tony Lieu on 11/1/23.
//

import UIKit

class TableViewController: UIViewController{
var emailAddress:String?
var numberArray = ["1","2","3"]
var fruit = ["bannana","orange","apple"]
    var userList: [User] = []
@IBOutlet weak var tables: UITableView!
override func viewDidLoad() {
    super.viewDidLoad()
    print("Email Address: \(emailAddress ?? "")")
    tables.dataSource = self
    tables.delegate = self
    let cellXib = UINib(nibName: "CustomTableViewCell", bundle: nil)
    tables.register(cellXib, forCellReuseIdentifier: "customCellID")
    readTheDataFromJSONFile()
}
    func readTheDataFromJSONFile(){
        let bundle = Bundle(for: TableViewController.self)
        let url = bundle.url(forResource: "userList", withExtension: "json")
        guard let url = url else{return}
        do{
            let rawData = try Data(contentsOf: url)
           let results = try JSONDecoder().decode(UserModel.self, from: rawData)
            userList = results.data
            DispatchQueue.main.async {
                self.tables.reloadData()
            }
            print(results)
        }catch{
            print(error.localizedDescription)
        }
        
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
extension TableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return numberArray.count
        case 1:
            return fruit.count
        default:
            return userList.count
        }
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
            let number = numberArray[indexPath.row]
            cell.textLabel?.text = number
            cell.accessoryType = .disclosureIndicator
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
            let number = fruit[indexPath.row]
            cell.textLabel?.text = number
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCellID", for: indexPath) as! CustomTableTableViewCell
            //let number = fruit[indexPath.row]
            let user = userList[indexPath.row]
            cell.titleLabel.text = user.first_name + " " + user.last_name
            cell.emailLabel.text = user.email
            //cell.titleLabel.text = number
            return cell
        }
        func numberOfSections(in tableView: UITableView) -> Int {
                return 3
            }
    }
}
