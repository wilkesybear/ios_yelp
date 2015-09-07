//
//  ShowMoreViewCell.swift
//  Yelp
//
//  Created by Andrew Wilkes on 9/7/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol ShowMoreViewCellDelegate {
    optional func showMoreViewCell(showMoreViewCell: ShowMoreViewCell, clicked value: Bool)
}

class ShowMoreViewCell: UITableViewCell {
    
    var delegate: ShowMoreViewCellDelegate?

    @IBOutlet weak var showMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func showMoreButtonClicked(sender: AnyObject) {
        delegate?.showMoreViewCell?(self, clicked: true)
    }

}
