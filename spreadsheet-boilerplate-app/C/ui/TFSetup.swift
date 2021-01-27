import UIKit // TFSetup.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func rePresentTextField() {                         //print("re-presenting text field & keyboard")
        let contents = textField.text!
        formatAndPresentTextField(contents)
        //setNavBarTitle(customString: "Add Data to Cell")
    }
}

extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil,
                              onCancel: (target: Any, action: Selector)? = nil) {
        
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        keyboardToolbarHeight = toolbar.frame.height
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {                     //print("tapped done button")
        topVC.exitInputModeWrapper(topVC.textField)
    }
    
    @objc func cancelButtonTapped() {                   //print("tapped cancel button")
        topVC.exitInputModeWrapper(topVC.textField)
    }
}

