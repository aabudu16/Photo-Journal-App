
import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet var selectedPhoto: UIImageView!
    var photoImage:PhotoJournal!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
    }
    
    private func setupImage (){
        selectedPhoto.image = UIImage(data: photoImage.picture)
    }
    
}

extension PhotoDetailViewController: ZoomingViewController{
    func ZoomingImageView(for transition: ZoomInTransitonDelegate) -> UIImageView? {
        return selectedPhoto
    }
    
    
}
