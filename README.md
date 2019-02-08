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
    // recover from NSInternalInconsistencyException
}
```
