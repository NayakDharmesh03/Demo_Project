//
//  ViewController.swift
//  NewAppProject
//
//  Created by Bhautik Dudhat on 24/04/23.
//


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//    Swift requires that a source file import the modules for any types that are referenced in code. For the Dealer module’s main.swift file, the Deck type from DeckOfPlayingCards and the PlayingCard type from PlayingCard are referenced. Although the shuffle() method on the Deck type uses the FisherYates module internally, that module does not need to be imported in main.swift.

//
//    import PackageDescription
//
//    let package = Package(
//        name: "DeckOfPlayingCards",
//        products: [
//            .library(name: "DeckOfPlayingCards", targets: ["DeckOfPlayingCards"]),
//        ],
//        dependencies: [
//            .package(url: "https://github.com/apple/example-package-fisheryates.git", from: "2.0.0"),
//            .package(url: "https://github.com/apple/example-package-playingcard.git", from: "3.0.0"),
//        ],
//        targets: [
//            .target(
//                name: "DeckOfPlayingCards",
//                dependencies: ["FisherYates", "PlayingCard"]),
//            .testTarget(
//                name: "DeckOfPlayingCardsTests",
//                dependencies: ["DeckOfPlayingCards"]),
//        ]
//    )
//

    

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
