//
//  ViewController.swift
//  sampleUI001
//
//  Created by Eriko Ichinohe on 2016/02/09.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // View動的追加用変数
    var aView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    var openFlag = false
    @IBOutlet weak var btnTap: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.aView = UIView(frame: CGRect(x: 0,y: myBoundSize.height,width: myBoundSize.width,height: 250))
        self.aView.backgroundColor = UIColor.green
        self.view.addSubview(aView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: { () -> Void in
            
            if (self.openFlag){
                //Viewが現れているので、隠す
                self.aView.frame = CGRect(x: 0,y: self.myBoundSize.height,width: self.myBoundSize.width,height: 250)
                
                //ボタンを元の位置に戻す
                self.btnTap.frame = CGRect(x: self.btnTap.frame.origin.x,y: self.btnTap.frame.origin.y + 250, width: self.btnTap.frame.width , height: self.btnTap.frame.height)
                self.openFlag = false
            }else{
                //Viewが隠れているので、表示する
                self.aView.frame = CGRect(x: 0,y: self.myBoundSize.height-250,width: self.myBoundSize.width,height: 250)
                
                //ボタンがViewに隠れないように同じ分移動させる
                self.btnTap.frame = CGRect(x: self.btnTap.frame.origin.x,y: self.btnTap.frame.origin.y - 250, width: self.btnTap.frame.width , height: self.btnTap.frame.height)
                self.openFlag = true
            }
            
            
            }, completion: { finished in
                print("Viewを動かしました")
        })
    }

}

