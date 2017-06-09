//
//  BUSimplePopupManager.swift
//  BUSimplePopups
//
//  Created by Burak Üstün on 08/06/17.
//  Copyright © 2017 Burak Üstün. All rights reserved.
//

import UIKit

public typealias BUSimplePopupCompletionBlock = (Void) -> Void

public class BUSimplePopupManager: NSObject {

    
    /** Shows a Popup
     *  @param title The title of the Popup view
     *  @param body The text that is displayed underneath the title
     *  @param onTap The block that should be executed when the user taps on the Popup
     */
    public func showPopup(Popup: BUSimplePopup) {
        DispatchQueue.main.async {
            if self.isPopupActive {
                let _ = self.dismissActivePopup(completion: { () -> Void in
                    self.showPopup(Popup: Popup)
                })
            } else {
                let PopupView = BUSimplePopupView.init(Popup: Popup, PopupManager: self)
                self.displayPopupView(PopupView: PopupView)
            }
        }
    }
    
    
    /** Dismisses the currently displayed PopupView with a completion block called after the Popup disappears off screen
     *  @param completion The block that should be executed when the Popup finishes dismissing
     *  @return true if Popup dismissal was triggered, false if no Popup was currently displayed.
     */
    public func dismissActivePopup(completion: BUSimplePopupCompletionBlock?) -> Bool {
        
        if isPopupActive {
            return self.dismissPopupView(PopupView: self.activePopup!, dismissAnimationCompletion: { () -> Void in
                self.activePopup = nil
                if completion != nil {
                    completion!()
                }
            })
        }
        
        return false
    }
    
    /** Dismisses the PopupView passed as an argument
     *  @param dismissAnimationCompletion The block that should be executed when the Popup finishes dismissing
     *  @return true if Popup dismissal was triggered, false if Popup was not currently displayed.
     */
    public func dismissPopupView(PopupView: BUSimplePopupView, dismissAnimationCompletion:BUSimplePopupCompletionBlock?) -> Bool {
        
        if PopupView.isDisplayed {
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: { [unowned self] () -> Void in
                
                UIView.animate(withDuration: 0.15,
                               animations: {
                                PopupView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                },
                               completion: { _ in
                                    PopupView.removeFromSuperview()
                                
                })
                
                PopupView.isDisplayed = false
                
                if self.activePopup == PopupView {
                    self.activePopup = nil
                }
                
                if dismissAnimationCompletion != nil {
                    dismissAnimationCompletion!()
                }
            })
            
            return true
        }
        
        return false
    }
    
    
    /**
     *  Indicates whether a Popup is currently active.
     *
     *  @return true if a Popup is being displayed
     */
    public var isPopupActive: Bool {
        return (self.activePopup != nil)
    }
    
    /**
     *  The active Popup, if there is one. nil if no Popup is currently active.
     */
    public var activePopup: BUSimplePopupView?
    
    /**
     *  Use to set the background color of Popups.
     */
    public var PopupsBackgroundColor: UIColor = UIColor.white
    
    /**
     *  Use to set the title text color of Popups
     */
    public var PopupsTitleTextColor: UIColor = UIColor.black
    
    /**
     *  Use to set the title text aligment of Popups
     */
    public var PopupsTitleTextAligment: NSTextAlignment = .center
    
    /**
     *  Use to set the body text aligment of Popups
     */
    public var PopupBodyTextAlignment: NSTextAlignment = .center
    
    /**
     *  Use to set the Popup image Width
     */
    public var PopupImageWidth:CGFloat = 75.0
    
    /**
     *  Use to set the Popup image Width
     */
    public var PopupImageHeight:CGFloat = 75.0
    
    /**
     *  Use to set the Popup background alpha
     */
    public var PopupBackgroundAlpha:CGFloat = 1.0
    
    /**
     *  Use to set the body text color of Popups.
     */
    public var PopupsBodyTextColor: UIColor = UIColor.black
    
    /**
     *  Use to set the title font of Popups.
     */
    public var PopupsTitleFont: UIFont = UIFont.boldSystemFont(ofSize: 14.0)
    
    /**
     *  Use to set the body font of Popups.
     */
    public var PopupsBodyFont: UIFont = UIFont.systemFont(ofSize: 12.0)
    
    // MARK: Internal
    private func displayPopupView(PopupView: BUSimplePopupView) {
        
        self.activePopup = PopupView
        
        PopupView.isDisplayed = true
        PopupView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(PopupView)
        
        UIView.animate(withDuration: 0.15,
                       animations: {
                        PopupView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.15) {
                            PopupView.transform = CGAffineTransform.identity
                        }
        })
        //Animasyon buraya eklenecek.
    }

}
