//
//  TableController.swift
//  GreenStep
//
//  Created by JIN on 7/24/25.
//

import UIKit


class MyTableController: UICollectionViewController {
    
    //MARK: - Properties
    
    private var pinterestLayout: PinterestLayout {
            return collectionViewLayout as! PinterestLayout
        }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setTitle()
        setPinterestLayoutDelegate()
    }
    
    //MARK: - Private Method
    
    private func setTitle() {
        navigationItem.title = "Table"
    }
    
    private func setPinterestLayoutDelegate() {
        pinterestLayout.delegate = self
    }

}

//MARK: - UI & Layout

extension MyTableController {
    
    func setup() {
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        collectionView.register(MyTableCell.self, forCellWithReuseIdentifier: MyTableCell.identifier)
        collectionView.backgroundColor = .systemBackground
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyTableCell.identifier, for: indexPath) as! MyTableCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}


//MARK: -Delegate

extension MyTableController: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

#Preview {
    MyTableController(collectionViewLayout: PinterestLayout())
}
