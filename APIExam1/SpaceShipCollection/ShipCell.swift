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
    
    var squareDegraded : UIView = {
      var squareDegraded = UIView()
        squareDegraded.layer.cornerRadius = 10
        squareDegraded.clipsToBounds = true
      return squareDegraded
    }()
    
    var name: UILabel = {
        var name = UILabel()
        name.textColor = .systemBlue
        name.font = UIFont(name: "Montserrat", size: 14)
        return name
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
    
    var cohete : UIImageView = {
       var cohete = UIImageView()
        cohete.image = UIImage(named: "Cohete")
        return cohete
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    func initUI(shipModelInformation: ModelShip){
        self.shipModelInformation = shipModelInformation
        
        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.purple.cgColor, UIColor.systemYellow.cgColor]
        newLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        squareDegraded.layer.addSublayer(newLayer)
        
        self.addSubview(squareDegraded)
        squareDegraded.addAnchorsAndCenter(centerX: true, centerY: true, width: (width - 40) / 2, height: 50, left: nil, top: nil, right: nil, bottom: nil)
        
        name.text = shipModelInformation.mission_name
        name.textAlignment = .center
        squareDegraded.addSubview(name)
        name.addAnchorsAndCenter(centerX: true, centerY: false, width: (width - 40) / 2, height: 16, left: nil, top: 5, right: nil, bottom: nil)
        
        let flight_number1 : Int =  shipModelInformation.flight_number ?? 0
        var flight_numberString = String(flight_number1)
        flightNumber.text = "NF: \(flight_numberString)"
        squareDegraded.addSubview(flightNumber)
        flightNumber.addAnchors(left: 5, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: name)
        
        nacionality.text = shipModelInformation.rocket?.second_stage?.payloads![0].nationality
        squareDegraded.addSubview(nacionality)
        nacionality.addAnchors(left: nil, top: 5, right: 10, bottom: nil, withAnchor: .top, relativeToView: name)
        
      
      cohete.sd_setImage(with: URL(string: "https://i.pinimg.com/736x/4d/a0/58/4da058668d6f15bb27ee4ab6997ebd99.jpg"),placeholderImage: UIImage(named: "Cohete"))
        addSubview(cohete)
        cohete.addAnchorsAndCenter(centerX: true, centerY: nil, width: 50, height: 50, left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: squareDegraded)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
