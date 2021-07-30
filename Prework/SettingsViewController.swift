import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var setTipsLabel: UILabel!
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Update darkMode (bool) in UserDefaults
        let isDark = defaults.bool(forKey: "darkMode")
        
        // Switch to dark theme if applicable
        if isDark {
            overrideUserInterfaceStyle = .dark
        }
        else {
            overrideUserInterfaceStyle = .light
        }
        
        let darkIsOn = defaults.bool(forKey: "darkModeSwitch")
        if darkIsOn {
            darkModeSwitch.setOn(true, animated: false)
        }
        else {
            darkModeSwitch.setOn(false, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Access UserDefaults
    let defaults = UserDefaults.standard
    
    @IBAction func setTip1(_ sender: Any) {
        // Set Tip Rate inputted for tip1 key
        defaults.set(Double(tip1TextField.text!) ?? 0, forKey: "tip1")
    }
    
    @IBAction func setTip2(_ sender: Any) {
        // Set Tip Rate inputted for tip2 key
        defaults.set(Double(tip2TextField.text!) ?? 0, forKey: "tip2")
    }
    
    @IBAction func setTip3(_ sender: Any) {
        // Set Tip Rate inputted for tip3 key
        defaults.set(Double(tip3TextField.text!) ?? 0, forKey: "tip3")
    }
    
    @IBAction func darkMode(_ sender: Any) {
        if darkModeSwitch.isOn {
            defaults.set(true, forKey: "darkMode")
            overrideUserInterfaceStyle = .dark
            defaults.set(true, forKey: "darkModeSwitch")
        }
        else {
            defaults.set(false, forKey: "darkMode")
            overrideUserInterfaceStyle = .light
            defaults.set(false, forKey: "darkModeSwitch")
        }
    }
}
