//
//  ImagesCollectionViewController.swift
//  Practice
//
//  Created by Badarinath Venkatnarayansetty on 7/20/17.
//  Copyright © 2017 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import UIKit

class ImageCollectionViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{
    
    override func viewDidLoad() {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionView
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
