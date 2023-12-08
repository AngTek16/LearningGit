//
//  ShipCell.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 30/11/23.
//

import UIKit
import SDWebImage

class ShipCell: UICollectionViewCell {
  
  var shipModelInformation : ModelShip?
  
  var cohete : UIImageView = {
    var cohete = UIImageView()
    return cohete
  }()
  
  var missionNameLabel: UILabel = {
    var name = UILabel()
    name.textColor = .black
//    name.textAlignment = .center
    name.numberOfLines = 2
//    name.backgroundColor = .red
    name.font = UIFont(name: "arial", size: 15)
    return name
  }()
  let siteLabel: UILabel = {
    var site = UILabel()
    site.font = UIFont(name: "arial", size: 15)
    return site
  }()
  
  var flightNumber: UILabel = {
    var flightNumber = UILabel()
    flightNumber.textColor = .systemMint
    flightNumber.font = UIFont(name: "Montserrat", size: 10)
    return flightNumber
  }()
  
  var nacionality: UILabel = {
    var nacionality = UILabel()
    nacionality.textColor = .black
    nacionality.font = UIFont(name: "Montserrat", size: 14)
    return nacionality
  }()
  override init(frame: CGRect) {
    super.init(frame: .zero)
  }
  
  func initUI(shipModelInformation: ModelShip){
    self.shipModelInformation = shipModelInformation
    self.backgroundColor = .white
    self.layer.cornerRadius = 20
    self.clipsToBounds = true
    
    self.layer.masksToBounds = false
    self.layer.shadowOpacity = 2
    self.layer.shadowOffset = .zero
    self.layer.shadowRadius = 2
    self.layer.shouldRasterize = true
    self.layer.cornerRadius = 4
    
    cohete.sd_setImage(with: URL(string: (shipModelInformation.links?.mission_patch)!), placeholderImage: UIImage(named: ""))
    self.addSubview(cohete)
    cohete.addAnchorsAndSize(width: 100, height: 100, left: 15, top: 20, right: nil, bottom: nil)
    
    missionNameLabel.text = shipModelInformation.mission_name
    missionNameLabel.backgroundColor = .red
    self.addSubview(missionNameLabel)
    missionNameLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: 250, height: 40, left: 30, top: 15, right: nil, bottom: nil,withAnchor: .left,relativeToView: cohete)
    
  
    
//    let flight_number1 : Int =  shipModelInformation.flight_number ?? 0
//    var flight_numberString = String(flight_number1)
//    flightNumber.text = "NF: \(flight_numberString)"
//    squareDegraded.addSubview(flightNumber)
//    flightNumber.addAnchors(left: 5, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: name)
//
//    nacionality.text = shipModelInformation.rocket?.second_stage?.payloads![0].nationality
//    squareDegraded.addSubview(nacionality)
//    nacionality.addAnchors(left: nil, top: 5, right: 10, bottom: nil, withAnchor: .top, relativeToView: name)
//
    //        cohete.addAnchorsAndCenter(centerX: true, centerY: nil, width: 50, height: 50, left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: squareDegraded)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
