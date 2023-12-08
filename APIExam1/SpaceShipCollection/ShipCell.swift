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
    name.numberOfLines = 2
    name.font = UIFont(name: "Arial Bold", size: 22)
    return name
  }()
  let siteLabel: UILabel = {
    var site = UILabel()
    site.textColor = .black
    site.numberOfLines = 2
    site.font = UIFont(name: "arial", size: 15)
    return site
  }()
  let launchLabel: UILabel = {
    var launch = UILabel()
    launch.textColor = .black
    launch.numberOfLines = 2
    launch.font = UIFont(name: "arial", size: 15)
    return launch
  
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
    missionNameLabel.backgroundColor = .white
    self.addSubview(missionNameLabel)
    missionNameLabel.addAnchorsAndSize(width: 150, height: 40, left: 30, top: 15, right: nil, bottom: nil,withAnchor: .left,relativeToView: cohete)
    
    
    siteLabel.text = shipModelInformation.launch_site?.site_name
    siteLabel.backgroundColor = .white
    self.addSubview(siteLabel)
    siteLabel.addAnchorsAndSize(width: 150, height: 40, left: 30, top: 45, right: nil, bottom: nil,withAnchor: .left,relativeToView: cohete)
    
    launchLabel.text = shipModelInformation.launch_year
    launchLabel.backgroundColor = .white
    self.addSubview(launchLabel)
    launchLabel.addAnchorsAndSize(width: 150, height: 40, left: 30, top: 75, right: nil, bottom: nil,withAnchor: .left,relativeToView: cohete)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
