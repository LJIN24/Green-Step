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
    
    let viewModel = MyTableViewModel()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setTitle()
        setPinterestLayoutDelegate()
        viewModel.fetchPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()

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
        return viewModel.posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyTableCell.identifier, for: indexPath) as! MyTableCell
        cell.configureWithData(with: viewModel.posts[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = viewModel.posts[indexPath.row]
        let detailVC = DetailViewController(post: post)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}


//MARK: -Delegate

extension MyTableController: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        guard let height =  viewModel.posts[indexPath.row].resizeImage?.size.height else { return 200}
        return height
       
    }
    
    
}

#Preview {
    MyTableController(collectionViewLayout: PinterestLayout())
}
