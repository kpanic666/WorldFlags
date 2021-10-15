//
//  ViewController.swift
//  WorldFlags
//
//  Created by Andrei Korikov on 14.10.2021.
//

import UIKit

class ViewController: UITableViewController {
    var pictureNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "World Flags"
        
        // As we can't read file names from Asset Catalog (because it's an archive)
        // then I put all flag's picture names from assets.xcassets into FlagNames.plist
        if let flagNamesURL = Bundle.main.url(forResource: "FlagNames", withExtension: "plist") {
            do {
                let data = try Data(contentsOf: flagNamesURL)
                pictureNames = try PropertyListSerialization.propertyList(
                    from: data,
                    options: [],
                    format: nil
                ) as! [String]
            } catch {
                print(error.localizedDescription)
            }
        }
        
        pictureNames.sort()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictureNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagPicture", for: indexPath)
        cell.imageView?.image = UIImage(named: pictureNames[indexPath.row])
        cell.textLabel?.text = pictureNames[indexPath.row].uppercased()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let pictureName = pictureNames[indexPath.row]
            vc.selectedImage = pictureName
            vc.title = pictureName.capitalized
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

