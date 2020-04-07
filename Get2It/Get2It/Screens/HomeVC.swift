//
//  HomeVC.swift
//  Get2It
//
//  Created by John Kouris on 3/28/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate {
    
    var dataSource: UICollectionViewDiffableDataSource<SectionLayoutKind, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupTemporaryButton()
        configureHierarchy()
        configureDataSource()
    }
    
    // Temporary to navigate to Task List VC
    func setupTemporaryButton() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(temporaryButtonTapped))
        self.navigationItem.rightBarButtonItem = addBarButton
    }
    
    @objc func temporaryButtonTapped() {
        let taskListVC = TaskListVC()
        taskListVC.title = "Task List"
        self.navigationController?.pushViewController(taskListVC, animated: true)
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: HeaderCell.reuseIdentifier)
        collectionView.register(SummaryCell.self, forCellWithReuseIdentifier: SummaryCell.reuseIdentifier)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.reuseIdentifier)
        view.addSubview(collectionView)
        collectionView.delegate = self
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionLayoutKind, Int>(collectionView: collectionView) {
            (collectionView:UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            let section = SectionLayoutKind(rawValue: indexPath.section)!
            
            if section == .list {
                // Get a cell of the desired kind
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.reuseIdentifier, for: indexPath) as? ListCell {
                    
                    // Populate the cell with our item description
                    cell.label.text = "\(identifier)"
                    
                    // Return the cell
                    return cell
                } else {
                    fatalError("Can't create new cell")
                }
            } else if section == .grid {
                // Get a cell of the desired kind
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SummaryCell.reuseIdentifier, for: indexPath) as? SummaryCell {
                    
                    cell.contentView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1)
                    cell.contentView.layer.borderColor = UIColor.black.cgColor
                    cell.contentView.layer.borderWidth = 0.2
                    cell.contentView.layer.cornerRadius = section == .grid ? 10 : 0
                    
                    // Return the cell
                    return cell
                } else {
                    fatalError("Can't create new cell")
                }
            } else {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCell.reuseIdentifier, for: indexPath) as? HeaderCell {
                    
                    cell.contentView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1)
                    cell.contentView.layer.borderColor = UIColor.black.cgColor
                    cell.contentView.layer.borderWidth = 0.2
                    cell.contentView.layer.cornerRadius = section == .header ? 10 : 0
                    
                    // Return the cell
                    return cell
                } else {
                    fatalError("Can't create new cell")
                }
            }
        }
        
        // Initial data
        var snapshot = NSDiffableDataSourceSnapshot<SectionLayoutKind, Int>()
        snapshot.appendSections([.header, .grid, .list])
        snapshot.appendItems([1], toSection: .header)
        snapshot.appendItems([2, 3], toSection: .grid)
        snapshot.appendItems([4, 5, 6], toSection: .list)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
