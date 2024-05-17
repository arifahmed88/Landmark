//
//  LandMarkCollectionViewCell.swift
//  Landmark
//
//  Created by ArifAhmed on 17/5/24.
//

import UIKit

class LandMarkCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "LandMarkCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func updateData(landmarkInfo:LandMarkInfo){
        titleLabel.text = landmarkInfo.name
        subTitleLabel.text = landmarkInfo.subtitle
        imageView.image = UIImage(named: landmarkInfo.imageName)
    }
}
