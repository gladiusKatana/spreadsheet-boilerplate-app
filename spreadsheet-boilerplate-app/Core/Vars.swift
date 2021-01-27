import UIKit // Vars.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

var globalWindow = UIWindow(frame: UIScreen.main.bounds)
///var sceneDelegate = SceneDelegate() //not (currently) using multiple windows on iPad or scene-view modal vc presentations

var navController: UINavigationController? = UINavigationController()
var dismissPinch = UIPinchGestureRecognizer()

var testRectanglelayer = CAShapeLayer()
var statusBarHeight = 0.0;                      var navBarHeight = 0.0
var currentCellWidth: CGFloat?;                 var currentCellHeight: CGFloat?
var xOffSet = CGFloat(0);                       var yOffset = CGFloat(0)
var textFieldHeight = CGFloat(30);              var textFieldY = CGFloat(0)
var textFieldWidth = CGFloat(0)

/// Set  keyboardSizeFindingMode  to  true , to manually determine* the keyboard heights for each iOS device & orientation (by launching the app on each device or its simulator)
/// *why do these preset values (keyboard heights) need to be manually determined?  Because keyboard heights for different iOS devices seem nowhere to be found online

var portraitKeyboardHeight = CGFloat(0);        var landscapeKeyboardHeight = CGFloat(0)
var keyboardHeight = CGFloat(0);                var keyboardToolbarHeight = CGFloat(0)

var keyboardSizeFindingMode = false
var firstPortraitKeyboardPresented = false;     var firstLandscapeKeyboardPresented = false

var customNightMode = true
var keyboardAsNumberPad = false;                var reloadLock = false
var textFieldDisplayed = false;                 var textFieldEditingMode = false

var justPinched = false;                        var appHasBeenLaunchedAtLeastOnce = false /// 1-way bool: only flipped to true once in app lifecycle

var currentOrientation = OrientationSize.neither
var previousOrientation = OrientationSize.neither
var launchOrientation = OrientationSize.neither

var defaultCellFont = UIFont.systemFont(ofSize: 12, weight: .regular) /// UIFont(name: "Helvetica Neue", size: 12)
var modelName = "device you're running on"
var phones = ["iPhone4", "iPhone 4s", "iPhone 5", "iPhone 5c", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone SE", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR"]

///var loadSymbolLegend =     "                                        💾 = view loaded"
///var appearSymbolLegend = "                                        🏞 = view appeared"  /// console legend

