//
//  CollectionViewSectionHeader.swift
//  Demo
//
//  Created by Grant Oganyan on 3/10/23.
//

import Foundation
import UIKit

class CollectionViewSectionHeader: UICollectionReusableView {
    let label = UILabel()
    
    let padding = 16.0

    private static let font = UIFont.preferredFont(forTextStyle: .headline)
    public static let fontSize = font.pointSize

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.InitLabel()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.InitLabel()
    }

    func InitLabel() {
        label.font = Self.font
        label.textColor = .label
        self.addSubview(label, anchors: [.leading(padding), .trailing(padding), .bottom(0)])
    }
}
