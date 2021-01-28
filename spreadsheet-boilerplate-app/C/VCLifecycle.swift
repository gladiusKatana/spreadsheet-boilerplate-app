import UIKit // VCLifecycle.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = globalWindow.backgroundColor
        collectionView.bounces = false
        
        statusBarHeightChangeNotificationSetup()
        keyboardNotificationSetup()
        setTopViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavBarButtons(grayTwo, greyIndex: buttonColorIndex, disabler: textFieldDisplayed)
        setTopViewController()
        
        reloadLock = false
        reloadCV()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //addPopupCollectionView()  /// implemented here for experimental purposes only
    }
}

