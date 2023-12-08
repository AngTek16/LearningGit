//
//  MyCustomViewViewController.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 30/11/23.
//

import UIKit

class MyCustomViewViewController: UIViewController {
  
  var dataSource = [ModelShip]()
  
  var spaceShipCollection : SpaceShipCollection = {
    var spaceShipCollection = SpaceShipCollection()
    spaceShipCollection.backgroundColor = .clear
    return spaceShipCollection
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    initUI()
    getData()
    
  }
  
  func getData(){
    let networkManager = NetworkManager()
    networkManager.delegate = self
    networkManager.getSpaceList()
  }
  
  func initUI(){
    spaceShipCollection.delegate = self
    view.addSubview(spaceShipCollection)
    spaceShipCollection.addAnchors(left: 15, top: 60, right: 15, bottom: 30)
    spaceShipCollection.backgroundColor = .white
//    (left: 10, top: 20, right: 10, bottom: 30
  }
  
}

extension MyCustomViewViewController : NetworkManagerDelegate {
  func responseSuccess(response: [ModelShip]) {
    print("responseSucess\(response)")
    dataSource.append(contentsOf: response)
    spaceShipCollection.receiveData(dataSource: dataSource)
  }
  
  func responseError(error: Error) {
    print("Error: \(error)")
  }
}

extension MyCustomViewViewController : SpaceShipCollectionDelegate{
  func selectedMision(indexPath: IndexPath) {
    
    let info = dataSource[indexPath.item]
    
    let specificMision = SpecificMisionViewController()
    
    specificMision.shipModelInformation = info
    specificMision.modalPresentationStyle = .fullScreen
    self.present(specificMision, animated: true)
  }
}
