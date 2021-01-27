import UIKit // NavBar.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

extension CollectionVC {
    
    func setupNavBarButtons(_ greyoutColor: UIColor?, greyIndex: Int?, disabler: Bool) {  //print("setting up nav bar buttons")
        
        let firstButton = setupButton(disabler: disabler, title: "timetableButton.001 copy",
                                      selector: #selector(buttonWrapperMethodforFirstVC))
        
        let secondButton = setupButton(disabler: disabler, title: "historyButton",
                                       selector: #selector(buttonWrapperMethodforSecondVC))
        
        let reloadButton = setupButton(disabler: disabler, title: "reloadButton",
                                       selector: #selector(reloadCVWrapperMethod))
        
        var barButtonColors = [UIColor]()
        
        let buttons = [secondButton, firstButton, reloadButton]
        navigationItem.rightBarButtonItems = buttons
        
        let color = graySeven /// default color, for buttons that present all but the current top view controller
        
        for _ in buttons {
            if barButtonColors.count <= buttons.count {barButtonColors.append(color)}
        }
        
        for button in buttons {
            guard let greyout = greyoutColor else {print("no greyout color"); return}
            guard let index = buttons.firstIndex(of: button) else {print("error finding button index"); return}
            
            let defaultColor = barButtonColors[index]
            button.tintColor = defaultColor
            
            if index == greyIndex {button.tintColor = greyout}
            
            if button == reloadButton {button.tintColor = .clear}
            
            if disabler && ![reloadButton].contains(button) {button.tintColor = greyout}
        }
    }
}

