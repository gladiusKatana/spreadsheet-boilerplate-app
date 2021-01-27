import UIKit // TestSquare.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder


func drawTestSquare() { /// for testing purposes only: to verify dynamic calculation of navbar height + status bar height, and thus, cell heights
    
    testRectanglelayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: statusBarHeight + navBarHeight,
                                                               width: 4, height: 4), cornerRadius: 0).cgPath
    let randNum = randomNumber(inRange: 1...6) - 1
    
    testRectanglelayer.fillColor = randomColors[randNum]
    
    globalWindow.layer.addSublayer(testRectanglelayer)
    
    //print("drawing rect clr[\(randNum)] @ (\(statusBarHeight + navBarHeight)\n")
}


public func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
    
    let length = Int64(range.upperBound - range.lowerBound + 1)
    
    let value = Int64(arc4random()) % length + Int64(range.lowerBound)
    
    return T(value)
}

