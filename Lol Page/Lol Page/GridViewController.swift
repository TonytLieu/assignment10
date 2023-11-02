//
//  GridViewController.swift
//  Lol Page
//
//  Created by Tony Lieu on 11/1/23.
//

import UIKit

class GridViewController: UIViewController{
    var img = UIImage(named: "why")
    var arrayDays = ["Sun","Monday","Tuesday","Wendenday","Thurs","Friday","Sat"]
    var numberMonths = ["Jan","Feb","March","April","May", "June","July","Aug","Oct", "Nov", "Dec"]
    @IBOutlet weak var collectionView: UICollectionView!
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
     1.Create New Screen showing use of Webview. Load any webpage into it.x
     2.Explore WKNavigationDelegate for Webview. Show how you restrict loading any url

     3. On your tableview view Screen, In one of the section load data from the attached JSON file
     show name, email, in cellx

     4.Create New Screen showing use of CollectionView having multiple sectionx
     5.On your tabelview in one of section load cell from custom Xib filex
    */
}
extension GridViewController:UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDays.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCellID", for: indexPath) as! GridViewCell
        var data = ""
        
        data = arrayDays[indexPath.row]
        cell.gridLabel.text = data
        cell.gridImageView.image = img
        
        
        return cell
    }
}
extension GridViewController:UICollectionViewDelegate{
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print(arrayDays[indexPath.row])
    }
}
