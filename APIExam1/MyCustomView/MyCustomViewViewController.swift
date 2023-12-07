//
//  MyCustomViewViewController.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 30/11/23.
//

import UIKit

class MyCustomViewViewController: UIViewController {
    
    var dataSource = [ModelShip]()
    
    var spaceBackground : UIImageView = {
       var spaceBackground = UIImageView()
        spaceBackground.image = UIImage(named: "Space")
        return spaceBackground
    }()
    
    var spaceShipCollection : SpaceShipCollection = {
        var spaceShipCollection = SpaceShipCollection()
        return spaceShipCollection
    }()
  
  
  var textView : UITextView = {
    var miTextView = UITextView()
    miTextView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    miTextView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    miTextView.isScrollEnabled = false
    return miTextView
  }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(spaceBackground)
       // spaceBackground.addAnchorsWithMargin(0)
        //initUI()
        //getData()
      iniTextView()
       }
  
  
  func iniTextView(){
    
    textView.text = "Hola a todo el mundo estoy escribiendo muchas cosas a ver si asi se puede lograr que el textview se haga mas grande Este form es para tomar en cuenta su preferencia para formar equipos, todos ya han formado diferentes equipos y con base en ello quiero formar unos equipos preliminares Este form es para tomar en cuenta su preferencia para formar equipos, todos ya han formado diferentes equipos y con base en ello quiero formar unos equipos preliminares Este form es para tomar en cuenta su preferencia para formar equipos, todos ya han formado diferentes equipos y con base en ello quiero formar unos equipos preliminares Este form es para tomar en cuenta su preferencia para formar equipos, todos ya han formado diferentes equipos y con base en ello quiero formar unos equipos preliminares "
    view.addSubview(textView)
    textView.addAnchorsAndSize(width: width - 20, height: nil, left: 10, top: 70, right: 10, bottom: nil)
    
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
