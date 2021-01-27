import UIKit // Buttons.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func setupButton(disabler: Bool, title: String, selector: Selector) -> UIBarButtonItem {
        
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        
        let selector =
            disabler && ![#selector(reloadCVWrapperMethod)].contains(selector)
            ? #selector(nullSelector)
            : selector
        
        return UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self,
                               action: selector)
    }
    
    @objc func nullSelector() {
        print("button disabled")
    }
    
    @objc func reloadCVWrapperMethod() {
        print("↺ reload collection view via button")
        reloadLock = false
        reloadCV()
    }
    
    @objc func buttonWrapperMethodforSecondVC() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.gotoView(vc: secondVC)
        }
    }
    
    @objc func buttonWrapperMethodforFirstVC() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.gotoView(vc: incomeAndExpensesVC)
        }
    }
}

