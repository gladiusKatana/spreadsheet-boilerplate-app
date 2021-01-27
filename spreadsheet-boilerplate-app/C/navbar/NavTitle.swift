import UIKit // NavTitle.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func setNavBarTitle(_ customString: String?) {    //print("setting nav bar title")
        
        var title = ""
        
        if customString != nil {
            title = customString!
        }
        
        //else {
        //title = "(default title)"
        //}
        
        setupViewTitle(title, numLines: 1, alignment: .left)
    }
}

extension UIViewController {
    
    func setupViewTitle(_ titleText: String, numLines: Int, alignment: NSTextAlignment) {
        
        var navbarTitleLabel = UILabel();
        navbarTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 1366, height: 20)) ///1366 is width (# of points) of the ipad pro 12.9"
        navbarTitleLabel.backgroundColor = .clear
        navbarTitleLabel.text = titleText; navbarTitleLabel.numberOfLines = numLines
        navbarTitleLabel.textAlignment = alignment
        navbarTitleLabel.font = UIFont(name: "Helvetica Neue", size: 13)
        navbarTitleLabel.textColor = .black
        navbarTitleLabel.isUserInteractionEnabled = false
        navigationItem.titleView = navbarTitleLabel
    }
    
}

