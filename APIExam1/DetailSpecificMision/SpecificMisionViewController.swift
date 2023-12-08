//
//  SpecificMisionViewController.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 03/12/23.
//

import UIKit

class SpecificMisionViewController: UIViewController {
    
    var shipModelInformation : ModelShip?

    var buttonBack : UIButton = {
        var buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "Back"), for: .normal)
        buttonBack.tintColor = .blue
        return buttonBack
      
    }()
  var detailsLabel: UILabel = {
      let details = UILabel()
      details.font = UIFont(name: "Arial", size: 30)
      details.text = "Details"
      if let font = details.font {
          let boldFont = UIFont.boldSystemFont(ofSize: font.pointSize)
          details.font = boldFont
      }
      details.textColor = UIColor(red: 0.00, green: 0.18, blue: 0.34, alpha: 1.00)
      details.translatesAutoresizingMaskIntoConstraints = false
      return details
  }()
  
  var missionNameLabel: UILabel = {
      let missionName = UILabel()
      missionName.font = UIFont(name: "Arial", size: 20)
    missionName.textAlignment = .center
    missionName.numberOfLines = 2
      missionName.textColor = .gray
      missionName.translatesAutoresizingMaskIntoConstraints = false
      return missionName
  }()
  var dateLabel:  UILabel = {
      let dateLabelMission = UILabel()
      dateLabelMission.textColor = .gray
      dateLabelMission.text = "Alan"
      dateLabelMission.font = UIFont(name: "Arial", size: 18)
      return dateLabelMission
  }()
  var siteLabel: UILabel = {
      let siteMission = UILabel()
      siteMission.textColor = .gray
      siteMission.text = "Yosh"
      siteMission.font = UIFont(name: "Arial", size: 18)
      return siteMission
  }()
  var rocketNameLabel: UILabel = {
      let rocketName = UILabel()
      rocketName.textColor = .gray
      rocketName.text = "ubaldo"
      rocketName.font = UIFont(name: "Arial", size: 18)
      return rocketName
  }()
  var rocketTypeLabel: UILabel = {
      let rocketType = UILabel()
      rocketType.textColor = .gray
      rocketType.text = "Marquez"
      rocketType.font = UIFont(name: "Arial", size: 18)
      return rocketType
  }()
  var descriptionText: UITextView = {
      let description = UITextView()
      description.font = UIFont.systemFont(ofSize: 18)
      description.textContainer.maximumNumberOfLines = 0
      description.textColor = .gray
      return description
  }()
  var videoButton: UIButton = {
      let video = UIButton()
      video.setTitle("YT Video", for: .normal)
      video.backgroundColor = UIColor(red: 1.00, green: 0.17, blue: 0.33, alpha: 1.00)
      video.layer.cornerRadius = 25
      return video
  }()
  var lauchInfoButton: UIButton = {
      let lauchInfo = UIButton()
      lauchInfo.setTitle("Launch Info", for: .normal)
      lauchInfo.backgroundColor = UIColor(red: 0.00, green: 0.18, blue: 0.34, alpha: 1.00)
      lauchInfo.layer.cornerRadius = 25
      return lauchInfo
  }()
  var playButton: UIButton = {
      let playVideo = UIButton()
      playVideo.setTitle("Play", for: .normal)
      playVideo.backgroundColor = UIColor(red: 1.00, green: 0.17, blue: 0.33, alpha: 1.00)
      playVideo.layer.cornerRadius = 27
      return playVideo
  }()
  var iButton: UIButton = {
      let iLaunch = UIButton()
      iLaunch.setTitle("i", for: .normal)
      iLaunch.backgroundColor = UIColor(red: 0.00, green: 0.18, blue: 0.34, alpha: 1.00)
      iLaunch.layer.cornerRadius = 27
      return iLaunch
  }()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }

    func initUI(){
    
        buttonBack.addTarget(self, action: #selector(backView), for: .touchUpInside)
        view.addSubview(buttonBack)
        buttonBack.addAnchorsAndSize(width: 40, height: 40, left: 10, top: 60, right: nil, bottom: nil)
      
     
      missionNameLabel.text = shipModelInformation?.mission_name
        view.addSubview(missionNameLabel)
      missionNameLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: 200, height: 45, left: nil, top: 55, right: nil, bottom: nil)
      
      view.addSubview(detailsLabel)
      detailsLabel.addAnchors(left: nil, top: 100, right: nil, bottom: nil)
      detailsLabel.addAnchors(left: 16, top: nil, right: nil, bottom: nil)
      
      dateLabel.text = "\(shipModelInformation?.launch_date_unix ?? 0 )"
      view.addSubview(dateLabel)
      dateLabel.addAnchors(left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top,relativeToView: detailsLabel)
      dateLabel.addAnchors(left: 16, top: nil, right: nil, bottom: nil)
      
      siteLabel.text =  shipModelInformation?.launch_site?.site_id
      view.addSubview(siteLabel)
      siteLabel.addAnchors(left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top,relativeToView: dateLabel)
      siteLabel.addAnchors(left: 16, top: nil, right: nil, bottom: nil)
      
      rocketNameLabel.text = shipModelInformation?.rocket?.rocket_name
      view.addSubview(rocketNameLabel)
      rocketNameLabel.addAnchors(left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top,relativeToView: siteLabel)
      rocketNameLabel.addAnchors(left: 16, top: nil, right: nil, bottom: nil)
      
      rocketTypeLabel.text = shipModelInformation?.rocket?.rocket_type
      view.addSubview(rocketTypeLabel)
      rocketTypeLabel.addAnchors(left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top,relativeToView: rocketNameLabel)
      rocketTypeLabel.addAnchors(left: 16, top: nil, right: nil, bottom: nil)
      
      
      descriptionText.text =  shipModelInformation?.details
      view.addSubview(descriptionText)
      descriptionText.addAnchors(left: nil, top: 30, right: nil, bottom: nil,withAnchor: .top,relativeToView: rocketTypeLabel)
      descriptionText.addAnchorsAndSize(width: 340, height: 200, left: 16, top: nil, right: nil, bottom: nil)
    }
  
    @objc func backView(){
        dismiss(animated: true)
    }
}
