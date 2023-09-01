//
//  WeatherForecastView.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/09/01.
//

import UIKit

class WeatherForecastView: UIView {

    let identifier = "WeatherForecastView"
    
    
    //MARK: - Outlets
    @IBOutlet weak var tuesdayLabel: UILabel! {
        didSet {
            tuesdayLabel.textColor = .white
            tuesdayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet weak var tuesdayImageView: UIImageView!
    
    @IBOutlet weak var tuesdayWeatherLabel: UILabel! {
        didSet {
            tuesdayWeatherLabel.textColor = .white
            tuesdayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet weak var wednesdayLabel: UILabel! {
        didSet {
            wednesdayLabel.textColor = .white
            wednesdayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet weak var wednesdayImageView: UIImageView!
    
    @IBOutlet weak var wednesdayWeatherLabel: UILabel! {
        didSet {
            wednesdayWeatherLabel.textColor = .white
            wednesdayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet weak var thursdayLabel: UILabel! {
        didSet {
            thursdayLabel.textColor = .white
            thursdayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet weak var thursdayImageView: UIImageView!
    
    @IBOutlet weak var thursdayWeatherLabel: UILabel! {
        didSet {
            thursdayWeatherLabel.textColor = .white
            thursdayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet weak var fridayLabel: UILabel! {
        didSet {
            fridayLabel.textColor = .white
            fridayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet weak var fridayImageView: UIImageView!
    
    @IBOutlet weak var fridayWeatherLabel: UILabel! {
        didSet {
            fridayWeatherLabel.textColor = .white
            fridayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet weak var saturdayLabel: UILabel! {
        didSet {
            saturdayLabel.textColor = .white
            saturdayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet weak var saturdayImageView: UIImageView!
    
    @IBOutlet weak var saturdayWeatherLabel: UILabel! {
        didSet {
            saturdayWeatherLabel.textColor = .white
            saturdayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }

    
    //MARK: - Variables
    var contentView: UIView?

    
    //MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.identifier, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configureForecastView(model: [ForecastModel]) {
        
        self.tuesdayImageView.image = UIImage(named: "ic_\(CurrentWeatherType.sunny.rawValue)")
        self.tuesdayWeatherLabel.text = model[0].temp
        
        self.wednesdayImageView.image = UIImage(named: "ic_\(CurrentWeatherType.sunny.rawValue)")
        self.wednesdayWeatherLabel.text = model[1].temp
        
        self.thursdayImageView.image = UIImage(named: "ic_\(CurrentWeatherType.sunny.rawValue)")
        self.thursdayWeatherLabel.text = model[2].temp
        
        self.fridayImageView.image = UIImage(named: "ic_\(CurrentWeatherType.sunny.rawValue)")
        self.fridayWeatherLabel.text = model[3].temp
        
        self.saturdayImageView.image = UIImage(named: "ic_\(CurrentWeatherType.sunny.rawValue)")
        self.saturdayWeatherLabel.text = model[4].temp
    }
}
