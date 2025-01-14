import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  // MARK: - Properties
  @IBOutlet var tableView: UITableView!
  @IBOutlet var searchFooter: SearchFooter!
  var filteredPokemon = [Pokemon]()
  var detailViewController: DetailViewController? = nil
  var pokemons = [Pokemon]()
   let searchController = UISearchController(searchResultsController: nil)
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredPokemon = pokemons.filter({( pokemon : Pokemon) -> Bool in
            return pokemon.name.lowercased().contains(searchText.lowercased()) || pokemon.number.contains(searchText)
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
  // MARK: - View Setup
  override func viewDidLoad() {
    super.viewDidLoad()
    
    pokemons = [
        Pokemon(number:"001", name:"Bulbasaur"),
        Pokemon(number:"002", name:"Ivysaur"),
        Pokemon(number:"003", name:"Venusaur"),
        Pokemon(number:"004", name:"Charmander"),
        Pokemon(number:"005", name:"Charmeleon"),
        Pokemon(number:"006", name:"Charizard"),
        Pokemon(number:"007", name:"Squirtle"),
        Pokemon(number:"008", name:"Wartortle"),
        Pokemon(number:"009", name:"Blastoise"),
        Pokemon(number:"010", name:"Caterpie"),
        Pokemon(number:"011", name:"Metapod"),
        Pokemon(number:"012", name:"Butterfree"),
        Pokemon(number:"013", name:"Weedle"),
        Pokemon(number:"014", name:"Kakuna"),
        Pokemon(number:"015", name:"Beedrill"),
        Pokemon(number:"016", name:"Pidgey"),
        Pokemon(number:"017", name:"Pidgeotto"),
        Pokemon(number:"018", name:"Pidgeot"),
        Pokemon(number:"019", name:"Rattata"),
        Pokemon(number:"020", name:"Raticate"),
        Pokemon(number:"021", name:"Spearow"),
        Pokemon(number:"022", name:"Fearow"),
        Pokemon(number:"023", name:"Ekans"),
        Pokemon(number:"024", name:"Arbok"),
        Pokemon(number:"025", name:"Pikachu"),
        Pokemon(number:"026", name:"Raichu"),
        Pokemon(number:"027", name:"Sandshrew"),
        Pokemon(number:"028", name:"Sandslash"),
        Pokemon(number:"029", name:"Nidoran♀"),
        Pokemon(number:"030", name:"Nidorina"),
        Pokemon(number:"031", name:"Nidoqueen"),
        Pokemon(number:"032", name:"Nidoran♂"),
        Pokemon(number:"033", name:"Nidorino"),
        Pokemon(number:"034", name:"Nidoking"),
        Pokemon(number:"035", name:"Clefairy"),
        Pokemon(number:"036", name:"Clefable"),
        Pokemon(number:"037", name:"Vulpix"),
        Pokemon(number:"038", name:"Ninetales"),
        Pokemon(number:"039", name:"Jigglypuff"),
        Pokemon(number:"040", name:"Wigglytuff"),
        Pokemon(number:"041", name:"Zubat"),
        Pokemon(number:"042", name:"Golbat"),
        Pokemon(number:"043", name:"Oddish"),
        Pokemon(number:"044", name:"Gloom"),
        Pokemon(number:"045", name:"Vileplume"),
        Pokemon(number:"046", name:"Paras"),
        Pokemon(number:"047", name:"Parasect"),
        Pokemon(number:"048", name:"Venonat"),
        Pokemon(number:"049", name:"Venomoth"),
        Pokemon(number:"050", name:"Diglett"),
        Pokemon(number:"051", name:"Dugtrio"),
        Pokemon(number:"052", name:"Meowth"),
        Pokemon(number:"053", name:"Persian"),
        Pokemon(number:"054", name:"Psyduck"),
        Pokemon(number:"055", name:"Golduck"),
        Pokemon(number:"056", name:"Mankey"),
        Pokemon(number:"057", name:"Primeape"),
        Pokemon(number:"058", name:"Growlithe"),
        Pokemon(number:"059", name:"Arcanine"),
        Pokemon(number:"060", name:"Poliwag"),
        Pokemon(number:"061", name:"Poliwhirl"),
        Pokemon(number:"062", name:"Poliwrath"),
        Pokemon(number:"063", name:"Abra"),
        Pokemon(number:"064", name:"Kadabra"),
        Pokemon(number:"065", name:"Alakazam"),
        Pokemon(number:"066", name:"Machop"),
        Pokemon(number:"067", name:"Machoke"),
        Pokemon(number:"068", name:"Machamp"),
        Pokemon(number:"069", name:"Bellsprout"),
        Pokemon(number:"070", name:"Weepinbell"),
        Pokemon(number:"071", name:"Victreebel"),
        Pokemon(number:"072", name:"Tentacool"),
        Pokemon(number:"073", name:"Tentacruel"),
        Pokemon(number:"074", name:"Geodude"),
        Pokemon(number:"075", name:"Graveler"),
        Pokemon(number:"076", name:"Golem"),
        Pokemon(number:"077", name:"Ponyta"),
        Pokemon(number:"078", name:"Rapidash"),
        Pokemon(number:"079", name:"Slowpoke"),
        Pokemon(number:"080", name:"Slowbro"),
        Pokemon(number:"081", name:"Magnemite"),
        Pokemon(number:"082", name:"Magneton"),
        Pokemon(number:"083", name:"Farfetch&#x27;d"),
        Pokemon(number:"084", name:"Doduo"),
        Pokemon(number:"085", name:"Dodrio"),
        Pokemon(number:"086", name:"Seel"),
        Pokemon(number:"087", name:"Dewgong"),
        Pokemon(number:"088", name:"Grimer"),
        Pokemon(number:"089", name:"Muk"),
        Pokemon(number:"090", name:"Shellder"),
        Pokemon(number:"091", name:"Cloyster"),
        Pokemon(number:"092", name:"Gastly"),
        Pokemon(number:"093", name:"Haunter"),
        Pokemon(number:"094", name:"Gengar"),
        Pokemon(number:"095", name:"Onix"),
        Pokemon(number:"096", name:"Drowzee"),
        Pokemon(number:"097", name:"Hypno"),
        Pokemon(number:"098", name:"Krabby"),
        Pokemon(number:"099", name:"Kingler"),
        Pokemon(number:"100", name:"Voltorb"),
        Pokemon(number:"101", name:"Electrode"),
        Pokemon(number:"102", name:"Exeggcute"),
        Pokemon(number:"103", name:"Exeggutor"),
        Pokemon(number:"104", name:"Cubone"),
        Pokemon(number:"105", name:"Marowak"),
        Pokemon(number:"106", name:"Hitmonlee"),
        Pokemon(number:"107", name:"Hitmonchan"),
        Pokemon(number:"108", name:"Lickitung"),
        Pokemon(number:"109", name:"Koffing"),
        Pokemon(number:"110", name:"Weezing"),
        Pokemon(number:"111", name:"Rhyhorn"),
        Pokemon(number:"112", name:"Rhydon"),
        Pokemon(number:"113", name:"Chansey"),
        Pokemon(number:"114", name:"Tangela"),
        Pokemon(number:"115", name:"Kangaskhan"),
        Pokemon(number:"116", name:"Horsea"),
        Pokemon(number:"117", name:"Seadra"),
        Pokemon(number:"118", name:"Goldeen"),
        Pokemon(number:"119", name:"Seaking"),
        Pokemon(number:"120", name:"Staryu"),
        Pokemon(number:"121", name:"Starmie"),
        Pokemon(number:"122", name:"Mr. Mime"),
        Pokemon(number:"123", name:"Scyther"),
        Pokemon(number:"124", name:"Jynx"),
        Pokemon(number:"125", name:"Electabuzz"),
        Pokemon(number:"126", name:"Magmar"),
        Pokemon(number:"127", name:"Pinsir"),
        Pokemon(number:"128", name:"Tauros"),
        Pokemon(number:"129", name:"Magikarp"),
        Pokemon(number:"130", name:"Gyarados"),
        Pokemon(number:"131", name:"Lapras"),
        Pokemon(number:"132", name:"Ditto"),
        Pokemon(number:"133", name:"Eevee"),
        Pokemon(number:"134", name:"Vaporeon"),
        Pokemon(number:"135", name:"Jolteon"),
        Pokemon(number:"136", name:"Flareon"),
        Pokemon(number:"137", name:"Porygon"),
        Pokemon(number:"138", name:"Omanyte"),
        Pokemon(number:"139", name:"Omastar"),
        Pokemon(number:"140", name:"Kabuto"),
        Pokemon(number:"141", name:"Kabutops"),
        Pokemon(number:"142", name:"Aerodactyl"),
        Pokemon(number:"143", name:"Snorlax"),
        Pokemon(number:"144", name:"Articuno"),
        Pokemon(number:"145", name:"Zapdos"),
        Pokemon(number:"146", name:"Moltres"),
        Pokemon(number:"147", name:"Dratini"),
        Pokemon(number:"148", name:"Dragonair"),
        Pokemon(number:"149", name:"Dragonite"),
        Pokemon(number:"150", name:"Mewtwo"),
        Pokemon(number:"151", name:"Mew"),
        Pokemon(number:"152", name:"Chikorita"),
        Pokemon(number:"153", name:"Bayleef"),
        Pokemon(number:"154", name:"Meganium"),
        Pokemon(number:"155", name:"Cyndaquil"),
        Pokemon(number:"156", name:"Quilava"),
        Pokemon(number:"157", name:"Typhlosion"),
        Pokemon(number:"158", name:"Totodile"),
        Pokemon(number:"159", name:"Croconaw"),
        Pokemon(number:"160", name:"Feraligatr"),
        Pokemon(number:"161", name:"Sentret"),
        Pokemon(number:"162", name:"Furret"),
        Pokemon(number:"163", name:"Hoothoot"),
        Pokemon(number:"164", name:"Noctowl"),
        Pokemon(number:"165", name:"Ledyba"),
        Pokemon(number:"166", name:"Ledian"),
        Pokemon(number:"167", name:"Spinarak"),
        Pokemon(number:"168", name:"Ariados"),
        Pokemon(number:"169", name:"Crobat"),
        Pokemon(number:"170", name:"Chinchou"),
        Pokemon(number:"171", name:"Lanturn"),
        Pokemon(number:"172", name:"Pichu"),
        Pokemon(number:"173", name:"Cleffa"),
        Pokemon(number:"174", name:"Igglybuff"),
        Pokemon(number:"175", name:"Togepi"),
        Pokemon(number:"176", name:"Togetic"),
        Pokemon(number:"177", name:"Natu"),
        Pokemon(number:"178", name:"Xatu"),
        Pokemon(number:"179", name:"Mareep"),
        Pokemon(number:"180", name:"Flaaffy"),
        Pokemon(number:"181", name:"Ampharos"),
        Pokemon(number:"182", name:"Bellossom"),
        Pokemon(number:"183", name:"Marill"),
        Pokemon(number:"184", name:"Azumarill"),
        Pokemon(number:"185", name:"Sudowoodo"),
        Pokemon(number:"186", name:"Politoed"),
        Pokemon(number:"187", name:"Hoppip"),
        Pokemon(number:"188", name:"Skiploom"),
        Pokemon(number:"189", name:"Jumpluff"),
        Pokemon(number:"190", name:"Aipom"),
        Pokemon(number:"191", name:"Sunkern"),
        Pokemon(number:"192", name:"Sunflora"),
        Pokemon(number:"193", name:"Yanma"),
        Pokemon(number:"194", name:"Wooper"),
        Pokemon(number:"195", name:"Quagsire"),
        Pokemon(number:"196", name:"Espeon"),
        Pokemon(number:"197", name:"Umbreon"),
        Pokemon(number:"198", name:"Murkrow"),
        Pokemon(number:"199", name:"Slowking"),
        Pokemon(number:"200", name:"Misdreavus"),
        Pokemon(number:"201", name:"Unown"),
        Pokemon(number:"202", name:"Wobbuffet"),
        Pokemon(number:"203", name:"Girafarig"),
        Pokemon(number:"204", name:"Pineco"),
        Pokemon(number:"205", name:"Forretress"),
        Pokemon(number:"206", name:"Dunsparce"),
        Pokemon(number:"207", name:"Gligar"),
        Pokemon(number:"208", name:"Steelix"),
        Pokemon(number:"209", name:"Snubbull"),
        Pokemon(number:"210", name:"Granbull"),
        Pokemon(number:"211", name:"Qwilfish"),
        Pokemon(number:"212", name:"Scizor"),
        Pokemon(number:"213", name:"Shuckle"),
        Pokemon(number:"214", name:"Heracross"),
        Pokemon(number:"215", name:"Sneasel"),
        Pokemon(number:"216", name:"Teddiursa"),
        Pokemon(number:"217", name:"Ursaring"),
        Pokemon(number:"218", name:"Slugma"),
        Pokemon(number:"219", name:"Magcargo"),
        Pokemon(number:"220", name:"Swinub"),
        Pokemon(number:"221", name:"Piloswine"),
        Pokemon(number:"222", name:"Corsola"),
        Pokemon(number:"223", name:"Remoraid"),
        Pokemon(number:"224", name:"Octillery"),
        Pokemon(number:"225", name:"Delibird"),
        Pokemon(number:"226", name:"Mantine"),
        Pokemon(number:"227", name:"Skarmory"),
        Pokemon(number:"228", name:"Houndour"),
        Pokemon(number:"229", name:"Houndoom"),
        Pokemon(number:"230", name:"Kingdra"),
        Pokemon(number:"231", name:"Phanpy"),
        Pokemon(number:"232", name:"Donphan"),
        Pokemon(number:"233", name:"Porygon2"),
        Pokemon(number:"234", name:"Stantler"),
        Pokemon(number:"235", name:"Smeargle"),
        Pokemon(number:"236", name:"Tyrogue"),
        Pokemon(number:"237", name:"Hitmontop"),
        Pokemon(number:"238", name:"Smoochum"),
        Pokemon(number:"239", name:"Elekid"),
        Pokemon(number:"240", name:"Magby"),
        Pokemon(number:"241", name:"Miltank"),
        Pokemon(number:"242", name:"Blissey"),
        Pokemon(number:"243", name:"Raikou"),
        Pokemon(number:"244", name:"Entei"),
        Pokemon(number:"245", name:"Suicune"),
        Pokemon(number:"246", name:"Larvitar"),
        Pokemon(number:"247", name:"Pupitar"),
        Pokemon(number:"248", name:"Tyranitar"),
        Pokemon(number:"249", name:"Lugia"),
        Pokemon(number:"250", name:"Ho-oh"),
        Pokemon(number:"251", name:"Celebi"),
        Pokemon(number:"252", name:"Treecko"),
        Pokemon(number:"253", name:"Grovyle"),
        Pokemon(number:"254", name:"Sceptile"),
        Pokemon(number:"255", name:"Torchic"),
        Pokemon(number:"256", name:"Combusken"),
        Pokemon(number:"257", name:"Blaziken"),
        Pokemon(number:"258", name:"Mudkip"),
        Pokemon(number:"259", name:"Marshtomp"),
        Pokemon(number:"260", name:"Swampert"),
        Pokemon(number:"261", name:"Poochyena"),
        Pokemon(number:"262", name:"Mightyena"),
        Pokemon(number:"263", name:"Zigzagoon"),
        Pokemon(number:"264", name:"Linoone"),
        Pokemon(number:"265", name:"Wurmple"),
        Pokemon(number:"266", name:"Silcoon"),
        Pokemon(number:"267", name:"Beautifly"),
        Pokemon(number:"268", name:"Cascoon"),
        Pokemon(number:"269", name:"Dustox"),
        Pokemon(number:"270", name:"Lotad"),
        Pokemon(number:"271", name:"Lombre"),
        Pokemon(number:"272", name:"Ludicolo"),
        Pokemon(number:"273", name:"Seedot"),
        Pokemon(number:"274", name:"Nuzleaf"),
        Pokemon(number:"275", name:"Shiftry"),
        Pokemon(number:"276", name:"Taillow"),
        Pokemon(number:"277", name:"Swellow"),
        Pokemon(number:"278", name:"Wingull"),
        Pokemon(number:"279", name:"Pelipper"),
        Pokemon(number:"280", name:"Ralts"),
        Pokemon(number:"281", name:"Kirlia"),
        Pokemon(number:"282", name:"Gardevoir"),
        Pokemon(number:"283", name:"Surskit"),
        Pokemon(number:"284", name:"Masquerain"),
        Pokemon(number:"285", name:"Shroomish"),
        Pokemon(number:"286", name:"Breloom"),
        Pokemon(number:"287", name:"Slakoth"),
        Pokemon(number:"288", name:"Vigoroth"),
        Pokemon(number:"289", name:"Slaking"),
        Pokemon(number:"290", name:"Nincada"),
        Pokemon(number:"291", name:"Ninjask"),
        Pokemon(number:"292", name:"Shedinja"),
        Pokemon(number:"293", name:"Whismur"),
        Pokemon(number:"294", name:"Loudred"),
        Pokemon(number:"295", name:"Exploud"),
        Pokemon(number:"296", name:"Makuhita"),
        Pokemon(number:"297", name:"Hariyama"),
        Pokemon(number:"298", name:"Azurill"),
        Pokemon(number:"299", name:"Nosepass"),
        Pokemon(number:"300", name:"Skitty"),
        Pokemon(number:"301", name:"Delcatty"),
        Pokemon(number:"302", name:"Sableye"),
        Pokemon(number:"303", name:"Mawile"),
        Pokemon(number:"304", name:"Aron"),
        Pokemon(number:"305", name:"Lairon"),
        Pokemon(number:"306", name:"Aggron"),
        Pokemon(number:"307", name:"Meditite"),
        Pokemon(number:"308", name:"Medicham"),
        Pokemon(number:"309", name:"Electrike"),
        Pokemon(number:"310", name:"Manectric"),
        Pokemon(number:"311", name:"Plusle"),
        Pokemon(number:"312", name:"Minun"),
        Pokemon(number:"313", name:"Volbeat"),
        Pokemon(number:"314", name:"Illumise"),
        Pokemon(number:"315", name:"Roselia"),
        Pokemon(number:"316", name:"Gulpin"),
        Pokemon(number:"317", name:"Swalot"),
        Pokemon(number:"318", name:"Carvanha"),
        Pokemon(number:"319", name:"Sharpedo"),
        Pokemon(number:"320", name:"Wailmer"),
        Pokemon(number:"321", name:"Wailord"),
        Pokemon(number:"322", name:"Numel"),
        Pokemon(number:"323", name:"Camerupt"),
        Pokemon(number:"324", name:"Torkoal"),
        Pokemon(number:"325", name:"Spoink"),
        Pokemon(number:"326", name:"Grumpig"),
        Pokemon(number:"327", name:"Spinda"),
        Pokemon(number:"328", name:"Trapinch"),
        Pokemon(number:"329", name:"Vibrava"),
        Pokemon(number:"330", name:"Flygon"),
        Pokemon(number:"331", name:"Cacnea"),
        Pokemon(number:"332", name:"Cacturne"),
        Pokemon(number:"333", name:"Swablu"),
        Pokemon(number:"334", name:"Altaria"),
        Pokemon(number:"335", name:"Zangoose"),
        Pokemon(number:"336", name:"Seviper"),
        Pokemon(number:"337", name:"Lunatone"),
        Pokemon(number:"338", name:"Solrock"),
        Pokemon(number:"339", name:"Barboach"),
        Pokemon(number:"340", name:"Whiscash"),
        Pokemon(number:"341", name:"Corphish"),
        Pokemon(number:"342", name:"Crawdaunt"),
        Pokemon(number:"343", name:"Baltoy"),
        Pokemon(number:"344", name:"Claydol"),
        Pokemon(number:"345", name:"Lileep"),
        Pokemon(number:"346", name:"Cradily"),
        Pokemon(number:"347", name:"Anorith"),
        Pokemon(number:"348", name:"Armaldo"),
        Pokemon(number:"349", name:"Feebas"),
        Pokemon(number:"350", name:"Milotic"),
        Pokemon(number:"351", name:"Castform"),
        Pokemon(number:"352", name:"Kecleon"),
        Pokemon(number:"353", name:"Shuppet"),
        Pokemon(number:"354", name:"Banette"),
        Pokemon(number:"355", name:"Duskull"),
        Pokemon(number:"356", name:"Dusclops"),
        Pokemon(number:"357", name:"Tropius"),
        Pokemon(number:"358", name:"Chimecho"),
        Pokemon(number:"359", name:"Absol"),
        Pokemon(number:"360", name:"Wynaut"),
        Pokemon(number:"361", name:"Snorunt"),
        Pokemon(number:"362", name:"Glalie"),
        Pokemon(number:"363", name:"Spheal"),
        Pokemon(number:"364", name:"Sealeo"),
        Pokemon(number:"365", name:"Walrein"),
        Pokemon(number:"366", name:"Clamperl"),
        Pokemon(number:"367", name:"Huntail"),
        Pokemon(number:"368", name:"Gorebyss"),
        Pokemon(number:"369", name:"Relicanth"),
        Pokemon(number:"370", name:"Luvdisc"),
        Pokemon(number:"371", name:"Bagon"),
        Pokemon(number:"372", name:"Shelgon"),
        Pokemon(number:"373", name:"Salamence"),
        Pokemon(number:"374", name:"Beldum"),
        Pokemon(number:"375", name:"Metang"),
        Pokemon(number:"376", name:"Metagross"),
        Pokemon(number:"377", name:"Regirock"),
        Pokemon(number:"378", name:"Regice"),
        Pokemon(number:"379", name:"Registeel"),
        Pokemon(number:"380", name:"Latias"),
        Pokemon(number:"381", name:"Latios"),
        Pokemon(number:"382", name:"Kyogre"),
        Pokemon(number:"383", name:"Groudon"),
        Pokemon(number:"384", name:"Rayquaza"),
        Pokemon(number:"385", name:"Jirachi"),
        Pokemon(number:"386", name:"Deoxys")

    ]
    
   
    // Setup the Search Controller
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Pokémon!"
    navigationItem.searchController = searchController
    definesPresentationContext = true
    
    if let splitViewController = splitViewController {
      let controllers = splitViewController.viewControllers
      detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if splitViewController!.isCollapsed {
      if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
        self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
      }
    }
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table View
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredPokemon.count
        }
        
        return pokemons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let pokemon: Pokemon
        if isFiltering() {
            pokemon = filteredPokemon[indexPath.row]
        } else {
            pokemon = pokemons[indexPath.row]
        }
        cell.textLabel!.text = pokemon.name
        cell.detailTextLabel!.text = ("#" + String(pokemon.number))
        return cell
    }
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let pokemon: Pokemon
        if isFiltering() {
            pokemon = filteredPokemon[indexPath.row]
        } else {
            pokemon = pokemons[indexPath.row]
        }
        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
        controller.detailPokemon = pokemon
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }
}

extension MasterViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
