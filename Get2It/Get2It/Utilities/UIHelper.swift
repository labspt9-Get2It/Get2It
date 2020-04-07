//
//  UIHelper.swift
//  Get2It
//
//  Created by John Kouris on 4/3/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

enum SectionLayoutKind: Int, CaseIterable {
    case header, grid, list
    
    var columnCount: Int {
        switch self {
        case .header:
            return 1
        case .grid:
            return 2
        case .list:
            return 1
        }
    }
}

enum UIHelper {
    static func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionLayoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }
            let columns = sectionLayoutKind.columnCount
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = columns == 1 ? NSCollectionLayoutDimension.absolute(44) : NSCollectionLayoutDimension.fractionalWidth(1/3)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        return layout
    }
}
