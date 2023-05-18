//
//  ViewController.swift
//  NewAppProject
//
//  Created by Bhautik Dudhat on 24/04/23.
//


import UIKit
/*
 let normalFont = UIFont.boldSystemFont(ofSize: 20)
 let selectedFont = UIFont.boldSystemFont(ofSize: 20)
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - new cod added by dharmesh
         
         // Set up the segmented control
         segmentedControl.insertSegment(withTitle: "Segment 1", at: 0, animated: false)
         segmentedControl.insertSegment(withTitle: "Segment 2", at: 1, animated: false)
         segmentedControl.insertSegment(withTitle: "Segment 3", at: 2, animated: false)
         segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
         view.addSubview(segmentedControl)
         
         // Set the font attributes
         let normalFont = UIFont.systemFont(ofSize: 20, weight: .bold)
         let selectedFont = UIFont.systemFont(ofSize: 20, weight: .bold)
         
         // Set the text color attributes
         let normalTextAttributes: [NSAttributedString.Key: Any] = [
             .foregroundColor: UIColor.gray,
             .font: normalFont
         ]
         
         let selectedTextAttributes: [NSAttributedString.Key: Any] = [
             .foregroundColor: UIColor.white,
             .font: selectedFont
         ]
         
         // Apply the text color attributes to the segmented control
         segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
         segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
         
         // Position the segmented control
         segmentedControl.frame = CGRect(x: 50, y: 100, width: 300, height: 40)
     }
     
     @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
         // Handle segmented control value changes here
         print("Selected segment index: \(sender.selectedSegmentIndex)")
     }
 
//MARK: -  end code


    @IBAction func btnMenuBarbuttonItemTapped(_ sender: UIBarButtonItem) {
        let camera = UIAction(title: "Camera", image: UIImage(systemName: "camera")){ _ in
            print("camera tapped")
        }
        let photo = UIAction(title: "Photo", image: UIImage(systemName: "photo.on.rectangle.angled")){ _ in
            print("photo tapped")
        }
        let menu = UIMenu(title: "Welcome!", children: [camera, photo])
        sender.menu = menu
    }
    
    @IBAction func btnMenuTapped(_ sender: UIButton) {
       
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
        
    }
    @IBAction func btnDeferredTapped(_ sender: UIButton) {
        let deferredElement = UIDeferredMenuElement { (menuElements) in
            let camera = UIAction(title: "Camera", image: UIImage(systemName: "camera")){ _ in
                print("camera tapped")
            }
            let photo = UIAction(title: "Photo", image: UIImage(systemName: "photo.on.rectangle.angled")){ _ in
                print("photo tapped")
            }
            let menu = UIMenu(title: "Welcome", options: .displayInline ,  children: [camera, photo])
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                menuElements([menu])
            }
        }
        
        let camera = UIAction(title: "Add", image: UIImage(systemName: "plus.circle")){ _ in
            print("camera tapped")
        }
        let photo = UIAction(title: "Edit", image: UIImage(systemName: "pencil.circle")){ _ in
            print("photo tapped")
        }
        let delete = UIAction(title: "Delete", image: UIImage(systemName: "minus.circle"), attributes: .destructive){ _ in
            print("photo tapped")
        }
        
        
        let menu = UIMenu(title: "Welcome!", children: [deferredElement,delete, photo, camera])
        sender.showsMenuAsPrimaryAction = true
        sender.menu = menu
    }
}
