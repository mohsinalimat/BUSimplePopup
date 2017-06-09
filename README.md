# BUSimplePopup

[![CI Status](http://img.shields.io/travis/burakustn@gmail.com/BUSimplePopup.svg?style=flat)](https://travis-ci.org/burakustn@gmail.com/BUSimplePopup)
[![Version](https://img.shields.io/cocoapods/v/BUSimplePopup.svg?style=flat)](http://cocoapods.org/pods/BUSimplePopup)
[![License](https://img.shields.io/cocoapods/l/BUSimplePopup.svg?style=flat)](http://cocoapods.org/pods/BUSimplePopup)
[![Platform](https://img.shields.io/cocoapods/p/BUSimplePopup.svg?style=flat)](http://cocoapods.org/pods/BUSimplePopup)

![sample](https://burakustn.com/assets/images/Posts/BUSimplePopup.gif)
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

Setup the BUSimplePopupManager

```swift
import UIKit
import BUSimplePopup

class ViewController: UIViewController {

    let PopupManager = BUSimplePopupManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        PopupManager.PopupsBackgroundColor = .white
        PopupManager.PopupsTitleTextColor  = .black
        PopupManager.PopupsBodyTextColor   = .darkGray
        PopupManager.PopupBackgroundAlpha  = 1.0
        PopupManager.PopupsTitleFont       = UIFont.init(name: "Futura", size: 20)!
    }
```

Create popup and show!

```swift
    let popup:BUSimplePopup = BUSimplePopup.init(_title: "BUSimplePopup",
                                                 _body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                                 _image: UIImage.init(named: "logo"))
    PopupManager.showPopup(Popup: popup)
```

You can customize everything below

```swift
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
     *  Use to set the Popup image Height
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

```

## Installation

BUSimplePopup is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BUSimplePopup"
```

## Author

Burak Üstün 
Burak@Ustun.co
Twitter.com/burakustn

## License

BUSimplePopup is available under the MIT license. See the LICENSE file for more info.
