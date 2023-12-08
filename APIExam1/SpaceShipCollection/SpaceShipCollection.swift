//
//  SpaceShipCollection.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 30/11/23.
//
import Foundation
import UIKit

protocol SpaceShipCollectionDelegate{
  func selectedMision(indexPath : IndexPath)
}

class SpaceShipCollection: UIView {
    
    var delegate : SpaceShipCollectionDelegate?
    
    var dataSource = [ModelShip]()

  let spacelabel: UILabel = {
    var space = UILabel()
    space.text = "Space X 🚀"
    space.textColor = .lightGray
    space.textAlignment = .center
    space.font = UIFont(name: "Arial Bold", size: 15)
    space.backgroundColor = .white
    
    return space
  }()
  let launcheslabel: UILabel = {
    var launches = UILabel()
    launches.text = "Launches Past"
    launches.font = UIFont(name: "Arial Bold", size: 22)
    launches.backgroundColor = .white
    
    return launches
  }()
    var collectionViewShip : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()
    init(){
        super.init(frame: .zero)
        initUI()
    }
    
    func initUI(){
      
      self.addSubview(spacelabel)
      spacelabel.addAnchorsAndCenter(centerX: true, centerY: false, width: 150, height: 30, left: nil, top: 10, right: nil, bottom: nil)
      
      self.addSubview(launcheslabel)
      launcheslabel.addAnchorsAndCenter(centerX: true, centerY: false, width: 50, height: 40, left: 10, top: 10, right: nil, bottom: nil,withAnchor: .top,relativeToView: spacelabel)
      
        collectionViewShip.delegate = self // Paso 6
        collectionViewShip.dataSource = self // Paso 6
        collectionViewShip.register(ShipCell.self, forCellWithReuseIdentifier: "cell") // Paso 5
        self.addSubview(collectionViewShip) // Paso 7
      
      collectionViewShip.addAnchors(left: 10, top: 20, right: 10, bottom: 30,withAnchor: .top,relativeToView: launcheslabel)
      
      

    }
    
    func receiveData(dataSource: [ModelShip]){
        self.dataSource = dataSource
        collectionViewShip.reloadData()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SpaceShipCollection : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShipCell
        
        let info = dataSource[indexPath.item]
        
        cell.initUI(shipModelInformation : info)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
      let width = collectionView.bounds.width // Ancho igual al ancho de la colección
          let height: CGFloat = 150
      
      return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectedMision(indexPath: indexPath)
        
        
        collectionView.reloadData()
        
    }
}
