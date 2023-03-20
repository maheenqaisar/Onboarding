# Onboarding
 ## Onboarding Example
Explanation of this code line by line:

 ```
 import UIKit
 ```
 
This line imports the UIKit framework, which provides a collection of user interface components for iOS apps.

 ```
 struct OnboardingSlide {
    let title: String
    let description: String
    let image: UIImage
}
```

This defines a struct named OnboardingSlide, which has three properties: title, description, and image, all of which are immutable (let). This struct represents the content of a single slide in an onboarding flow.
import UIKit

```
class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
```

This defines a OnboardingViewController class, which is a subclass of UIViewController. It has three IBOutlet properties: collectionView, nextBtn, and pageControl, which are connected to UI elements in a storyboard or nib file. It also has three instance variables: slides, which is an array of OnboardingSlide structs; currentPage, which is the index of the currently displayed slide; and an observer for the currentPage variable that updates the pageControl and nextBtn UI elements based on the current page index.

```
override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nextBtn)
        
        slides = [
            OnboardingSlide(title: "Unlocking a World of Possibilities", description: "Reading can help you gain knowledge, better understand the world around you, and even help you relax.", image: #imageLiteral(resourceName: "1")),
            OnboardingSlide(title: "Discover the Joys of a Good Story", description: "Books are more than just entertainment - they can also teach valuable lessons, help you explore new worlds, and provide comfort in difficult times", image: #imageLiteral(resourceName: "4")),
            OnboardingSlide(title: "Helping Young Minds Grow", description: "Reading helps children develop their creativity and understanding of the world around them.", image: #imageLiteral(resourceName: "3"))
        ]
        pageControl.numberOfPages = slides.count
    }
 ```
 
This is an overridden method called viewDidLoad, which is called when the view controller's view hierarchy is loaded into memory. In this method, the nextBtn is added as a subview of the view, the slides array is populated with three OnboardingSlide instances, and the pageControl's numberOfPages property is set to the count of slides.

```
@IBAction func nextBtnClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "OurHomeVC") as!
            UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
```

This is an action method that is triggered when the nextBtn is clicked.

https://user-images.githubusercontent.com/124521487/226339750-ebb545cb-cc21-4fda-bcd4-3b65c1926349.mp4

