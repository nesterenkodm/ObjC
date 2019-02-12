# ObjC

Helper method to catch unexpected ObjC exceptions in Swift.

## Usage

```swift
do {
    try ObjC.catchException {
        let collectionView = UICollectionView()
        collectionView.insertItems(at: [IndexPath(row: 10, section: 10)])
    }
} catch {
    print(error.localizedDescription) // prints "UICollectionView must be initialized with a non-nil layout parameter"
    
    if case ObjC.Error.exception(let exception) = error {
        print(exception.callStackSymbols) // prints stack trace
    }
    
    // recover from NSInternalInconsistencyException
}
```
