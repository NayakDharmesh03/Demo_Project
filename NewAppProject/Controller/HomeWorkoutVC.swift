//
//  HomeWorkoutVC.swift
//  NewAppProject
//
//  Created by NT 2 on 12/04/23.
//

import UIKit
import SideMenu

class HomeWorkoutVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var manuView: UIView!
    let viewcolors = [UIColor.yellow, UIColor.red,UIColor.green, UIColor.blue,UIColor.yellow, UIColor.red,UIColor.green, UIColor.blue,UIColor.green, UIColor.blue]


    var ExerciseNames = ["Running",
                         "Stretching",
                         "Push-Ups",
                         "Pull-ups"
                        ]
    
    var ArrWorkOut:[HomeWorkoutCellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropShadow()
        self.manuView.alpha = 0
        
    
        createArr()
     
           
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
            let touch = touches.first
            if touch?.view != self.manuView
            {
                manuView.alpha = 0
                self.dismiss(animated: true, completion: nil)
                
            }
    }
    
    func createArr(){
        
        let obj1 = HomeWorkoutCellData(arrColors: UIColor.red, WorkType: "Running", Switch: false, Slider: 10,_star1:false,_star2:false,_star3:false)
        let obj2 = HomeWorkoutCellData(arrColors: UIColor.orange, WorkType: "Push-Ups", Switch: false, Slider: 20,_star1:false,_star2:false,_star3:false)
        let obj3 = HomeWorkoutCellData(arrColors: UIColor.yellow, WorkType: "Strecthing", Switch: false, Slider: 30,_star1:false,_star2:false,_star3:false)
        let obj4 = HomeWorkoutCellData(arrColors: UIColor.green, WorkType: "Playing", Switch: false, Slider: 40,_star1:false,_star2:false,_star3:false)
        let obj5 = HomeWorkoutCellData(arrColors: UIColor.blue, WorkType: "Gamming", Switch: false, Slider: 50,_star1:false,_star2:false,_star3:false)
        let obj6 = HomeWorkoutCellData(arrColors: UIColor.purple, WorkType: "Singing", Switch: false, Slider: 60,_star1:false,_star2:false,_star3:false)
        let obj7 = HomeWorkoutCellData(arrColors: UIColor.brown, WorkType: "Swiming", Switch: false, Slider: 10,_star1:false,_star2:false,_star3:false)
        let obj8 = HomeWorkoutCellData(arrColors: UIColor.black, WorkType: "Catching", Switch: false, Slider: 20,_star1:false,_star2:false,_star3:false)
        let obj9 = HomeWorkoutCellData(arrColors: UIColor.green, WorkType: "Eating", Switch: false, Slider: 30,_star1:false,_star2:false,_star3:false)
        let obj10 = HomeWorkoutCellData(arrColors: UIColor.red, WorkType: "Dancing", Switch: false, Slider: 40,_star1:false,_star2:false,_star3:false)
        let obj11 = HomeWorkoutCellData(arrColors: UIColor.magenta, WorkType: "Putting", Switch: false, Slider: 50,_star1:false,_star2:false,_star3:false)
        
        self.ArrWorkOut.append(obj1)
        self.ArrWorkOut.append(obj2)
        self.ArrWorkOut.append(obj3)
        self.ArrWorkOut.append(obj4)
        self.ArrWorkOut.append(obj5)
        self.ArrWorkOut.append(obj6)
        self.ArrWorkOut.append(obj7)
        self.ArrWorkOut.append(obj8)
        self.ArrWorkOut.append(obj9)
        self.ArrWorkOut.append(obj10)
        self.ArrWorkOut.append(obj11)
    }
    
    
    func dropShadow() {
        manuView.layer.masksToBounds = false
        manuView.layer.shadowColor = UIColor.black.cgColor
        manuView.layer.shadowOpacity = 0.5
        manuView.layer.shadowOffset = .zero
        manuView.layer.shadowRadius = 5
        manuView.layer.shouldRasterize = true
        
    }
    @IBAction func showSideBar(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as! SideMenuNavigationController
        if UIDevice.current.userInterfaceIdiom == .pad{
            vc.settings.menuWidth = self.view.frame.width - 200
        }else{
            vc.settings.menuWidth = self.view.frame.width - 80
        }
        vc.settings.presentationStyle = .viewSlideOut
        vc.settings.statusBarEndAlpha = 0
        vc.leftSide = true
        present(vc, animated: true, completion: nil)
    }
    
    
    
    //MARK:- Star ratting buttons Action
    
    @IBAction func starRattingAction(_ sender: UIButton) {
        
    }
    
    //MARK:- Switch Action

    @IBAction func switchAction(_ sender: UISwitch) {
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: Int(sender.tag), section: 0)) as? HomeWorkoutTableViewCell else{
            return
        }
        
        let value = cell.mySlider.value
        let obj = self.ArrWorkOut[sender.tag]
        if obj.Switch == true{
            obj.Switch = false
            obj.Slider = Int(value)
            cell.mySlider.isEnabled = false
            sender.isOn = false
        }else{
            obj.Switch = true
            sender.isOn = true
            cell.mySlider.isEnabled = true
            obj.Slider = Int(value)
        }
    }
    
    
    //MARK:- Slider Action --------
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: Int(sender.tag), section: 0)) as? HomeWorkoutTableViewCell else{
            return
        }
        
        let value = sender.value
        cell.sliderValu.text = "\(Int(value.rounded()))/100"
        cell.progressBar.progress = value/100
        cell.progressCurrentValue.text = String(Int(value))
        cell.coloreView.alpha = CGFloat(value/100)
        let obj = self.ArrWorkOut[sender.tag]
        obj.Slider = Int(value)
        

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.manuView.alpha = 0
    }
    @IBAction func showMnau(_ sender: UIButton) {
            let camera = UIAction(title: "Camera"){ _ in
                print("camera tapped")
            }
            let camera1 = UIAction(title: "Camera"){ _ in
                print("camera tapped")
            }
            let camera2 = UIAction(title: "Camera"){ _ in
                print("camera tapped")
            }
            let camera3 = UIAction(title: "Camera"){ _ in
                print("camera tapped")
            }
            let photo = UIAction(title: "Photo"){ _ in
                print("photo tapped")
            }
            let menu = UIMenu(title: "OptionList!", children: [camera,camera1,camera2,camera3,photo])
            sender.showsMenuAsPrimaryAction = true
            sender.menu = menu

//        self.manuView.alpha = 1
    }
 
}
extension HomeWorkoutVC : UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrWorkOut.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeWorkoutTableViewCell
        
       
        let cellObj = ArrWorkOut[indexPath.row]

        cell.exerciseNameLabel.text = cellObj.WorkType
        cell.coloreView.backgroundColor = cellObj.arrColors
        cell.btnSwitch.isOn = cellObj.Switch
        cell.mySlider.value = Float(Int(cellObj.Slider))
        cell.star1.isSelected = cellObj.star1
        cell.star2.isSelected = cellObj.star2
        cell.star3.isSelected = cellObj.star3
        cell.star1.tag = indexPath.row
        cell.star2.tag = indexPath.row
        cell.star3.tag = indexPath.row

        cell.btnSwitch.tag = indexPath.row
        cell.sliderValu.tag = indexPath.row
        cell.mySlider.tag = indexPath.row
        cell.progressBar.tag = indexPath.row
        cell.progressBar.progress = Float(cell.mySlider.value/100)
        cell.coloreView.alpha = CGFloat(cell.mySlider.value/100)
        cell.sliderValu.text = "\(Int(cell.mySlider.value))/\(cell.sliderMaxvalue)"
        cell.progressCurrentValue.text = "\(Int(cell.mySlider.value))"
        
        if cell.btnSwitch.isOn == false{
            cell.mySlider.isEnabled = false
        }else{
            cell.mySlider.isEnabled = true
        }
        
        return cell

    }
}
