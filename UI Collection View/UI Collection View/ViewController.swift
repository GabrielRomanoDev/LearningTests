//
//  ViewController.swift
//  UI Collection View
//
//  Created by Gabriel Luz Romano on 04/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let reuseIdentifier = "YourCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

/*
// Implement UICollectionViewDataSource protocol via Swift extension
*/
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourCell", for: indexPath)
                
                return cell
    }
    
    
  
    
    // Optional
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 0
    }
}

/*
// Implement UICollectionViewDelegateFlowLayout protocol via Swift extension
*/
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    // Optional
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let sideSize = collectionView.frame.size.width / 5 - 10;
        return CGSize(width: sideSize, height: sideSize);
    }
    
}
