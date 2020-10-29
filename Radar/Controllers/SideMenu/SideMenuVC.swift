//
//  SideMenuVC.swift
//  Radar
//
//  Created by Vivek Dharmani on 23/10/20.
//

import UIKit
import Hero

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class SideMenuVC: UIViewController {

    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var sideMenuTB: UITableView!
    @IBOutlet weak var myView: UIView!
    
    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?
    
    var namesArray = ["Home","Host Dashboard","My Events","Event Flyers/Feed","ETA MAP","Search","Create Event","Event Board","Message","Notification","Log Out","Analytics","Settings","Help"]
    var imgArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuTB.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cloaseButton(_ button:UIButton!) {        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.buttonClose){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
//        Hero.shared.defaultAnimation = HeroDefaultAnimationType.cover(direction: .left)
//        self.navigationController?.hero.isEnabled = true
//        self.navigationController?.popViewController(animated: true)
        
        if let presentedVC = presentedViewController {
            let transition = CATransition()
//            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            presentedVC.view.window!.layer.add(transition, forKey: kCATransition)
        }
        
        dismiss(animated: false, completion: nil)
        
//        presentedVC = nil
        
        
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
