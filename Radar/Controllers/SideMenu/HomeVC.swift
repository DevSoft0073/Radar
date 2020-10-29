//
//  HomeVC.swift
//  Radar
//
//  Created by Vivek Dharmani on 23/10/20.
//

import UIKit
import Hero

class HomeVC: UIViewController, CAAnimationDelegate {
    
    var imgArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func openMenu(_ sender: Any) {
        
//        let vc = SideMenuVC.instantiate(fromAppStoryboard: .Home)
//        self.navigationController?.pushViewController(vc, animated: true)
        
        let vc = SideMenuVC.instantiate(fromAppStoryboard: .Home)
        let transition = CATransition.init()
        transition.duration = 0.45
        transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.push //Transition you want like Push, Reveal
        transition.subtype = CATransitionSubtype.fromLeft // Direction like Left to Right, Right to Left
        transition.delegate = self
        view.window!.layer.add(transition, forKey: kCATransition)
        self.navigationController?.pushViewController(vc, animated: true)
        
//        let vc = SideMenuVC.instantiate(fromAppStoryboard: .Home)
//        let nvc = UINavigationController(rootViewController: vc)
//        present(nvc, animated: false, pushing: true, completion: nil)
        
//        Hero.shared.defaultAnimation = HeroDefaultAnimationType.cover(direction: .right)
//
//        let vc = SideMenuVC.instantiate(fromAppStoryboard: .Home)
//        self.navigationController?.hero.isEnabled = true
//        self.navigationController?.pushViewController(vc, animated: true)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class AddImgCollectionViewCell: UICollectionViewCell {
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as! AddImgCollectionViewCell
        return cell
    }
    
    
}
