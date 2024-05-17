//
//  ViewController.swift
//  Landmark
//
//  Created by ArifAhmed on 17/5/24.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var collectionHolderView: UIView!
    
    var collectionView = {
        let lineSpace:CGFloat = 10
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let leftRightInset:CGFloat = 16
        layout.sectionInset = UIEdgeInsets(top: 10, left: leftRightInset, bottom: 10, right: leftRightInset)
        layout.minimumInteritemSpacing = lineSpace
        layout.minimumLineSpacing = lineSpace
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = false
        return collectionView
    }()
    
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigure()
        viewModel.updateData(){
            DispatchQueue.main.async {[weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    private func viewConfigure(){
        blurViewEdit(view: blurView)
        collectionviewConfigure()
    }
    
    private func blurViewEdit(view:UIVisualEffectView){
        DispatchQueue.main.async {
            if let backDropLayer = view.layer.sublayers?.first{
                backDropLayer.filters?.removeAll(where: { filter in
                    String(describing: filter) != "gaussianBlur"
                })
            }
        }
    }
    
    private func collectionviewConfigure(){
        let nib = UINib(nibName: LandMarkCollectionViewCell.className, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: LandMarkCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionHolderView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.collectionHolderView.snp.top)
            make.bottom.equalTo(self.collectionHolderView.snp.bottom)
            make.left.equalTo(self.collectionHolderView.snp.left)
            make.right.equalTo(self.collectionHolderView.snp.right)
        }
    }

}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.landMarkList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LandMarkCollectionViewCell.identifier, for: indexPath) as! LandMarkCollectionViewCell
        cell.backgroundColor = .blue
        let item = viewModel.landMarkList[indexPath.item]
        cell.updateData(landmarkInfo: item)
        return cell
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getcollectionViewCellSize()
    }
    
    private func getcollectionViewCellSize() -> CGSize {
        let cellWidth = floor((UIScreen.main.bounds.width-10-16*2)*0.5)
        return CGSize(width: cellWidth, height: cellWidth)
    }
}



