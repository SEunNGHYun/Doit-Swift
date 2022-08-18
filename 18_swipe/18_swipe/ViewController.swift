import UIKit

class ViewController: UIViewController {
    let numOfTouchs = 2

    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    
    var imgLeft = [UIImage]()
    var imgDown = [UIImage]()
    var imgUp = [UIImage]()
    var imgRight = [UIImage]()
    //아마자 배열에 추가

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)

        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)

        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewRight.image = imgRight[0]
        imgViewLeft.image = imgLeft[0]
        //처음 화면에 보여질 이미지를 뽑아와 화면에 보여줌
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let dd = UISwipeGestureRecognizer(target: <#T##Any?#>, action: <#T##Selector?#>)
        //화면에서 인식할 수 있는 제스쳐를 추가 합니다.(한손가락으로 위, 아래, 오른쪽, 왼쪽 스와이프)
        //스와이프 이벤트 발생시 선언해 놓은 respondToSwipeGesture 함수가 실행이 되도록 선언
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        //화면 에서 인식할 수 있는 제스쳐를 추가 합니다.(두 손가락으로 위, 아래, 오른쪽, 왼쪽 스와이프)
        //스와이프 이벤트 발생시 선언해 놓은 respondToSwipeGestureMulti 함수가 실행이 되도록 선언
    }
    
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]

            switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up :
                    imgViewUp.image = imgUp[1]
                case UISwipeGestureRecognizer.Direction.down :
                    imgViewDown.image = imgDown[1]
                case UISwipeGestureRecognizer.Direction.right :
                    imgViewRight.image = imgRight[1]
                case UISwipeGestureRecognizer.Direction.left :
                    imgViewLeft.image = imgLeft[1]
                default :
                    break
            }}
        //제스쳐 이벤트 발생시 제스쳐 방향에 맞는 화살표이미지로 변경
    }
    
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]

            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up :
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down :
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.right :
                imgViewRight.image = imgRight[2]
            case UISwipeGestureRecognizer.Direction.left :
                imgViewLeft.image = imgLeft[2]
            default :
                break
            }}
        //제스쳐 이벤트 발생시 제스쳐 방향에 맞는 화살표이미지로 변경
    }
}

