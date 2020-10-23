//
//  SideMenuVC.swift
//  Radar
//
//  Created by Vivek Dharmani on 23/10/20.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var sideMenuTB: UITableView!
    @IBOutlet weak var myView: UIView!
    var namesArray = ["Home","Host Dashboard","My Events","Event Flyers/Feed","ETA MAP","Search","Create Event","Event Board","Message","Notification","Log Out","Analytics","Settings","Help"]
    var imgArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuTB.separatorStyle = .none
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        myView.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

class SideMenuTBCell: UITableViewCell {
    
    @IBOutlet weak var iconImages: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension SideMenuVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTBCell") as! SideMenuTBCell
        cell.nameLbl.text = namesArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
