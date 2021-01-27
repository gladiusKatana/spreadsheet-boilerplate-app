import UIKit // CellStruct.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder


struct CellStruct<T: Hashable, U: Hashable>: Hashable {
    
    let values : (T, U)
    
    func hash(into hasher: inout Hasher) {
        let (a,b) = values
        hasher.combine(a.hashValue &* 31 &+ b.hashValue)
    }
    
}


func == <T:Hashable,U:Hashable> (lhs: CellStruct<T,U>,
                                 rhs: CellStruct<T,U>)
-> Bool {                                               /// comparison function for conforming to Equatable protocol
    
    return lhs.values == rhs.values
    
}

