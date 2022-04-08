//
//  ListViewController.swift
//  Demo-App
//
//  Created by Saravanan Rethinam.
//

import UIKit

class ListViewController: UIViewController {
    
    var programCollectionView: UICollectionView!
    var programViewModel : ProgramsViewModel!
    var programType: ProgramType = .series

    private var dataSource : ProgramCollectionViewDataSource<ProgramCollectionViewCell, Entry>!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupViewModel()
    }
    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()

        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        programCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        programCollectionView.register(ProgramCollectionViewCell.self, forCellWithReuseIdentifier: ProgramsFeatureStrings.cellIdentifier)
        view.addSubview(programCollectionView)

        programCollectionView.translatesAutoresizingMaskIntoConstraints = false
        programCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        programCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        programCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        programCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        programCollectionView.delegate = self
    }

    func setupViewModel(){
        
        self.programViewModel =  ProgramsViewModel()
        self.programViewModel.updateViewWithLatetData = {
            self.updateDataSource()
        }
    }

    func updateDataSource(){
        let entries = programViewModel.programData.entries.filter { $0.releaseYear >= 2010 && $0.programType == self.programType }.sorted{ (lhs: Entry, rhs: Entry) -> Bool in
            return lhs.title.compare(rhs.title) == .orderedAscending
        }
        self.dataSource = ProgramCollectionViewDataSource(cellIdentifier: ProgramsFeatureStrings.cellIdentifier, items: entries, configureCell: { (cell, entry) in
            cell.backgroundColor = .white
            cell.update(withTitle: entry.title, releaseYear: "\(entry.releaseYear)", imageUrl: entry.images.posterArt.url, forAccessId: entry.title)
        })
        
        DispatchQueue.main.async {
            self.programCollectionView.dataSource = self.dataSource
            self.programCollectionView.reloadData()
        }
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cvWidth = collectionView.bounds.width - 8
        let columnWidth = cvWidth/2
        return CGSize(width: columnWidth, height: 350)
    }
}
