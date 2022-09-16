import UIKit

struct PhotoAlbum {
    var image: String
    var text: String
}

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categories = ["Fusce sed mauris augue. Donec egestas lacus eget dui rutrum vehicula eu vel nibh. Fusce sagittis dictum ante eu tristique. Cras sed ultrices diam. Donec placerat purus sit amet commodo convallis. Donec molestie odio lectus, sed semper nisi ullamcorper at. Quisque at varius sapien. Aenean venenatis tincidunt neque non gravida. Aliquam eget fringilla eros. Quisque volutpat velit vel aliquet pulvinar.", "In lacus orci, sollicitudin quis ligula eget, blandit mattis est. Sed cursus eros nec eros posuere volutpat. Curabitur semper lacinia commodo. Nam elementum consequat eleifend. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent nec rhoncus mauris, et facilisis eros. Nam finibus velit elit, eu commodo mi volutpat in. Vestibulum id viverra justo. Praesent sit amet eleifend massa, non interdum turpis.", "Maecenas ac maximus nunc. Quisque aliquam condimentum enim sed consequat. Quisque pretium non mi ac fermentum. Donec at viverra ex. Cras in magna venenatis, fermentum tortor vel, rutrum nisl. Proin mattis mi finibus enim tincidunt, eget scelerisque libero posuere. Quisque vehicula mi non nisl vehicula laoreet. Etiam venenatis congue tincidunt. Nulla sed ex nisi.", "Duis nibh lacus, consequat ac placerat id, vestibulum nec est. Suspendisse potenti. Nam ac enim elit. Pellentesque sollicitudin ultricies sem eu hendrerit. Suspendisse auctor semper laoreet. Nullam faucibus quis elit non posuere. Donec vehicula dolor sit amet neque aliquet tristique. Sed lobortis iaculis fermentum. Sed id risus nisi. Vivamus ipsum nulla, pulvinar congue mollis nec, mattis vel lectus.", "Nunc id lectus imperdiet, vehicula nisi vel, lobortis sem. Quisque et mauris sit amet mi eleifend bibendum. Morbi augue dolor, consequat vel bibendum tempus, aliquam vel dui. Nullam volutpat nunc sed ultrices porttitor. Nulla cursus accumsan viverra. Aenean sagittis non turpis sed efficitur. Pellentesque eleifend vitae odio ut dapibus. In a quam at quam tincidunt sodales in tincidunt tellus. Integer placerat vel erat eget finibus. Duis eu tempor felis. Fusce libero erat, luctus eget pretium eget, porta eget purus.", "Pellentesque nec auctor metus. Ut nec maximus ex. Donec sagittis nibh ac varius volutpat. Praesent ornare sit amet libero nec convallis. Ut feugiat condimentum enim in efficitur. Nunc at nisl a purus facilisis sagittis. Nam nec metus tincidunt, maximus tortor non, luctus mi. Nulla vitae finibus urna. Sed efficitur luctus mollis. Suspendisse efficitur ullamcorper nunc, non molestie tellus pretium vitae."]
    var photoAlbum = [PhotoAlbum]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        for photo in 1...37{
            photoAlbum.append(PhotoAlbum(image: "\(photo)", text: categories.randomElement()!))
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:300)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        let photo = photoAlbum[indexPath.row]
        // 2
        cell.cellImageView.image = UIImage(named: "\(photo.image)")
        // 3
        //cell.cellLbl.text = photo.text
        // 4
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(photoAlbum[indexPath.row])")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            secondVC.secondLabelText = photoAlbum[indexPath.row].text
            secondVC.secondImageView = UIImage(named: "\(photoAlbum[indexPath.row].image)")
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
}
