import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet var myMapView: MKMapView!
    
    @IBOutlet var lbLocation1: UILabel!
    @IBOutlet var lbLocation2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbLocation1.text = ""
        lbLocation2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        //위치 정보를 가져오기 위하여 사용자에게 권한 요구
        locationManager.startUpdatingLocation()
        //위치 정보를 업데이트 합니다.
        myMapView.showsUserLocation = true
    }
    
    func goLocation(latit: CLLocationDegrees, long:CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2D(latitude: latit, longitude: long)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        //지도의 확대 수준을 설정..?
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMapView.setRegion(pRegion, animated: false)
        
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span: Double, title strTitle: String, subTitle strSubTitle : String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latit: latitudeValue, long: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        myMapView.addAnnotation(annotation)
        //지도뷰 위치 포인터에 title과 subTitle응 설정한다.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let pLocation = locations.last
        //위치가 변경이 되면 촤신 웨치를 불러옵니다,
        _ = goLocation(latit: (pLocation?.coordinate.latitude)!, long: (pLocation?.coordinate.longitude)!, delta: 0.01)
        //새로 불러온 위도와 경도로 지도를 불러온다, delta는 지도의 확대 사이즈
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            //위치에 주소를 label에 나타냄
            let pm = placemarks!.first
            let country = pm!.country
            var address : String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }

            self.lbLocation2.text = "현재위치"
            self.lbLocation2.text = address
        })

        locationManager.startUpdatingHeading()
    }

    @IBAction func sgChangeLocattion(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lbLocation1.text = ""
            self.lbLocation2.text = ""
            locationManager.startUpdatingLocation()
        //현재 위치를 가져와 갱신
        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학교 강릉캠퍼스", subTitle: "강원도 강릉시 남산초교실 121")
            self.lbLocation1.text = "보고계신 위치"
            self.lbLocation2.text = "한국폴리텍대학교 강릉캠퍼스"
        //대학교 위치로 갱신
        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스퍼블리싱", subTitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lbLocation1.text = "보고계신 위치"
            self.lbLocation2.text = "이지스퍼블리싱 출판사"
        //출판사 위치로 갱신
            
        }
    }
}

