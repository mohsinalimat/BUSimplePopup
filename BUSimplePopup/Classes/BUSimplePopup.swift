//
//  BUSimplePopup.swift
//  BUSimplePopups
//
//  Created by Burak Üstün on 08/06/17.
//  Copyright © 2017 Burak Üstün. All rights reserved.
//

import UIKit

public class BUSimplePopup: NSObject {
    /**
     *  The title of this Popup
     */
    public var title: String?
    
    /**
     *  The body of this Popup
     */
    public var body: String?
    
    /**
     *  The image of this Popup
     */
    public var image: UIImage?
    
    /**
     *  An optional callback to be triggered whan a Popup is tapped in addition to dismissing the Popup.
     */
    public var onTap: BUSimplePopupCompletionBlock?
    
    /**
     *  An optional callback to be triggered whan a Popup times out without being tapped.
     */
    public var onTimeout: BUSimplePopupCompletionBlock?
    
    /** Initializer for a LNRPopup. this library.
     *  @param title The title of the Popup view
     *  @param body The body of the Popup view (optional)
     *  @param duration The duration this Popup should be displayed (optional)
     *  @param onTap The block that should be executed when the user taps on the Popup
     *  @param onTimeout A block that should be executed when the Popup times out. If the Popup duration is set to endless (-1) this block will never be called.
     */
    public init(_title: String?, _body: String?, _image: UIImage?, _onTap: BUSimplePopupCompletionBlock? = nil, _onTimeout: BUSimplePopupCompletionBlock? = nil) {
        self.title      = _title
        self.body       = _body
        self.image      = _image
        self.onTap      = _onTap
        self.onTimeout  = _onTimeout
    }
}
