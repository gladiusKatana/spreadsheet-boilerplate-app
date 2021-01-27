import UIKit // CollectionVC.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

class CollectionVC: UICollectionViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    var viewControllerType = CollectionViewType.firstVCType;    var balanceSums : [Double] = []
    var customFlowLayout: CustomFlowLayout?;                    var buttonColorIndex: Int?
    var showLoadAndAppearIndicationInConsole = false;           var backgroundColor = UIColor.clear
    
    lazy var textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.isEnabled = true
        return textField
    }()
    
    init(_ vcType: CollectionViewType, backgroundColor: UIColor,
         buttonColorIndex: Int?, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.viewControllerType = vcType
        self.backgroundColor = backgroundColor
        self.buttonColorIndex = buttonColorIndex
        self.customFlowLayout = layout as? CustomFlowLayout
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (customFlowLayout!.loadsHorizontally) ? customFlowLayout!.cols : customFlowLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (customFlowLayout!.loadsHorizontally) ? customFlowLayout!.rows : customFlowLayout!.cols
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {return true}
}

