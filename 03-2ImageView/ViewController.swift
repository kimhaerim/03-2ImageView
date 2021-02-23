//
//  ViewController.swift
//  03-2ImageView
//
//  Created by 김해림 on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false //확대 여부를 나타내는 변수
    var imgOn: UIImage? //켜진 전구 이미지가 있는 UIImage 타입의 변수
    var imgOff: UIImage? //꺼진 전구 이미지가 있는 UIImage 타입의 변수
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image=imgOn
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        //scale상수, 이미지를 확대할 배율 값, 2배로 확대
        var newWidth: CGFloat, newHeight: CGFloat
        //확대할 크기를 계산해서 보관할 변수
        
        if (isZoom) { //true, 현재 상태가 확대일때, isZoom이 true
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal) //버튼을 확대로 변경함
        }
        else { //false
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        //CGsize 메서드를 이용해 이미지 뷰의 프레임 크기를 변경함
        isZoom = !isZoom
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn { //스위치가 On이면
            imgView.image = imgOn
        }
        else{ //스위치가 Off이면
            imgView.image = imgOff
        }
        
    }
    
}

