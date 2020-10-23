//
//  DisplayAlertManager.swift
//  Nodat
//
//  Created by apple on 05/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
class DisplayAlertManager : NSObject, UITextFieldDelegate {
    
    static var shared = DisplayAlertManager()
    
    //------------------------------------------------------
    
    //MARK: Customs
    
    func displayAlert(target : AnyObject? = nil, animated : Bool, message : String, okTitle: String, handlerOK:(()->Void)?) {
        
        if let controller : UIViewController = UIApplication.topViewController() {
            
            let alertController = UIAlertController(title: kAppName, message: message, preferredStyle: UIAlertController.Style.alert)
            
            let actionOK = UIAlertAction(title: okTitle, style: UIAlertAction.Style.default) { (OK : UIAlertAction) in
                
                handlerOK?()
            }
            
            alertController .addAction(actionOK)
            controller .present(alertController, animated: animated, completion: nil)
        }
    }
//
//    func displayAlertWithInputs(target : UIViewController, animated : Bool, message : String, inputPlaceHolders:[String], handlerCancel:(()->Void)?, handlerSave:(()->Void)?) {
//
//        let alertController = UIAlertController(title: kAppName, message: message, preferredStyle: UIAlertController.Style.alert)
//
//        let actionCancel = UIAlertAction(title: alertTitleCancel, style: UIAlertAction.Style.default) { (CANCEL : UIAlertAction) in
//
//            handlerCancel?()
//        }
//
//        let actionSave = UIAlertAction(title: alertTitleSave, style: UIAlertAction.Style.default) { (SAVE : UIAlertAction) in
//
//            //get all text from fields
//            handlerSave?()
//        }
//
//        //add input
//        var textPlaceHolders : [UITextField] = []
//        var index : Int = 0
//
//        for placeholder in inputPlaceHolders {
//
//            alertController.addTextField { (textField : UITextField) in
//                textField.placeholder = placeholder.localized()
//                textField.delegate = target as? UITextFieldDelegate
//                objc_setAssociatedObject(textField, &keyAssociatedAactionSave, actionSave, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//                textField.tag = index
//                textPlaceHolders.append(textField)
//                index = index + 1
//            }
//        }
//        objc_setAssociatedObject(alertController, &keyAssociatedAlertPlaceHolder, textPlaceHolders, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
//
//        alertController .addAction(actionCancel)
//
//        actionSave.isEnabled = false
//        alertController .addAction(actionSave)
//
//        target.present(alertController, animated: animated, completion: nil)
//    }
    
    func displayAlertWithCancelOk(target : UIViewController, animated : Bool, message : String, alertTitleOk: String, alertTitleCancel: String, handlerCancel:@escaping (()->Void?), handlerOk:@escaping (()->Void?)) {
        
        let alertController = UIAlertController(title: kAppName, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let actionCancel = UIAlertAction(title: alertTitleCancel, style: UIAlertAction.Style.default) { (CANCEL : UIAlertAction) in
            
            handlerCancel()
        }
        
        let actionSave = UIAlertAction(title: alertTitleOk, style: UIAlertAction.Style.default) { (SAVE : UIAlertAction) in
            
            handlerOk()
        }
        
        alertController .addAction(actionCancel)
        alertController .addAction(actionSave)
        
        target.present(alertController, animated: animated, completion: nil)
    }
//
//    func displayAlertWithNoYes(target : UIViewController, animated : Bool, message : String, handlerNo:@escaping (()->Void), handlerYes:@escaping (()->Void)) {
//
//        let alertController = UIAlertController(title: kAppName.localized(), message: message.localized(), preferredStyle: UIAlertController.Style.alert)
//
//        let actionCancel = UIAlertAction(title: alertTitleNo.localized(), style: UIAlertAction.Style.default) { (CANCEL : UIAlertAction) in
//
//            handlerNo()
//        }
//
//        let actionSave = UIAlertAction(title: alertTitleYes.localized(), style: UIAlertAction.Style.default) { (SAVE : UIAlertAction) in
//
//            handlerYes()
//        }
//
//        alertController .addAction(actionCancel)
//        alertController .addAction(actionSave)
//
//        target.present(alertController, animated: animated, completion: nil)
//    }
//    
//    func displayActionSheet(target : AnyObject, animated : Bool, message : String, handlerCamera:@escaping (()->Void), handlerPhotoLibrary:@escaping (()->Void), handlerCancel:@escaping (()->Void)) {
//        
//        var controller : UIViewController!;
//        
//        if target is UIViewController {
//            controller = target as? UIViewController
//        } else {
//            return
//        }
//        
//        let alertController = UIAlertController(title: kAppName.localized(), message: message.localized(), preferredStyle: UIAlertController.Style.actionSheet)
//        
//        let actionCamera = UIAlertAction(title: alertTitleCamera.localized(), style: UIAlertAction.Style.default) { (OK : UIAlertAction) in
//            
//            handlerCamera()
//        }
//        alertController .addAction(actionCamera)
//        
//        let actionPhotoLibrary = UIAlertAction(title: alertTitlePhoto.localized(), style: UIAlertAction.Style.default) { (OK : UIAlertAction) in
//            
//            handlerPhotoLibrary()
//        }
//        alertController .addAction(actionPhotoLibrary)
//        
//        let actionCancel = UIAlertAction(title: alertTitleCancel.localized(), style: UIAlertAction.Style.cancel) { (OK : UIAlertAction) in
//            
//            handlerCancel()
//        }
//        alertController .addAction(actionCancel)
//    
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            alertController.modalPresentationStyle = .popover
//            if let popoverController = alertController.popoverPresentationController {
//                popoverController.sourceView = controller.view
//                popoverController.sourceRect = CGRect(origin: alertController.view.center, size: CGSize(width: 0, height: 0))
//                popoverController.permittedArrowDirections = .init(rawValue: 0)
//            
//                controller .present(alertController, animated: animated, completion: nil)
//            }
//        } else {
//         
//            controller .present(alertController, animated: animated, completion: nil)
//        }
//    }
//    
//    func displayActionSheet(target : AnyObject, titles: [String], animated : Bool, message : String, success: @escaping(_ selectedTitle: String?) -> Void) {
//        
//        var controller : UIViewController!;
//        
//        if target is UIViewController {
//            controller = target as? UIViewController
//        } else {
//            return
//        }
//        
//        let alertController = UIAlertController(title: kAppName.localized(), message: message.localized(), preferredStyle: UIAlertController.Style.actionSheet)
//        
//        for title in titles {
//            
//            let action = UIAlertAction(title: title.localized(), style: UIAlertAction.Style.default) { (OK : UIAlertAction) in
//                success(OK.title)
//            }
//            alertController .addAction(action)
//        }
//        
//        let actionCancel = UIAlertAction(title: alertTitleCancel.localized(), style: UIAlertAction.Style.cancel) { (OK : UIAlertAction) in
//            success(nil)
//        }
//        alertController .addAction(actionCancel)
//        
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            alertController.modalPresentationStyle = .popover
//            if let popoverController = alertController.popoverPresentationController {
//                popoverController.sourceView = controller.view
//                popoverController.sourceRect = CGRect(origin: alertController.view.center, size: CGSize(width: 0, height: 0))
//                popoverController.permittedArrowDirections = .init(rawValue: 0)
//                controller .present(alertController, animated: animated, completion: nil)
//            }
//        } else {
//            controller .present(alertController, animated: animated, completion: nil)
//        }
//    }
}
