import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var detailDescriptionLabel: UILabel!
  @IBOutlet weak var pokemonImageView: UIImageView!
  
  var detailPokemon: Pokemon? {
    didSet {
      configureView()
    }
  }
  
  func configureView() {
    if let detailPokemon = detailPokemon {
      if let detailDescriptionLabel = detailDescriptionLabel, let pokemonImageView = pokemonImageView {
        detailDescriptionLabel.text = detailPokemon.name
        pokemonImageView.image = UIImage(named: detailPokemon.name.lowercased())
        title = detailPokemon.category
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}

/*

 import UIKit
 
 class DetailViewController: UIViewController {
 
 @IBOutlet weak var detailDescriptionLabel: UILabel!
 @IBOutlet weak var candyImageView: UIImageView!
 
 var detailCandy: Candy? {
 didSet {
 configureView()
 }
 }
 
 func configureView() {
 if let detailCandy = detailCandy {
 if let detailDescriptionLabel = detailDescriptionLabel, let candyImageView = candyImageView {
 detailDescriptionLabel.text = detailCandy.name
 candyImageView.image = UIImage(named: detailCandy.name)
 title = detailCandy.category
 }
 }
 }
 
 override func viewDidLoad() {
 super.viewDidLoad()
 configureView()
 }
 
 override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 }
 
 }
 
 */