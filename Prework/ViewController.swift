import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sliderTipLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var sliderControl: UISlider!
    
    // Access UserDefaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tippy"
        // Set tip defaults
        defaults.set(15, forKey: "tip1")
        defaults.set(18, forKey: "tip2")
        defaults.set(20, forKey: "tip3")
        
        defaults.set(false, forKey: "darkMode")
        defaults.set(false, forKey: "darkModeSwitch")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Update Tip amount in UserDefaults
        let tip1 = defaults.double(forKey: "tip1")
        let tip2 = defaults.double(forKey: "tip2")
        let tip3 = defaults.double(forKey: "tip3")
        
        // Update Segmented Control Titles
        tipControl.setTitle(String(format: "%2.0f%%", tip1), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%2.0f%%", tip2), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%2.0f%%", tip3), forSegmentAt: 2)
        
        // Update darkMode (bool) in UserDefaults
        let isDark = defaults.bool(forKey: "darkMode")
        
        // Switch to dark theme if applicable
        if isDark {
            overrideUserInterfaceStyle = .dark
        }
        else {
            overrideUserInterfaceStyle = .light
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func sliderTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
               
        // Get tip amount from slider
        let sliderPercentage = Double(sliderControl.value)
               
        // Get total tip by multiplying tip * sliderPercentage
        let tip = bill * sliderPercentage/100
        let total = bill + tip
               
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        // Update Slider Tip Label
        sliderTipLabel.text = String(format: "%.2f%%", sliderPercentage)

    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [defaults.double(forKey: "tip1"), defaults.double(forKey: "tip2"), defaults.double(forKey: "tip3")]
        let tip = bill * (tipPercentages[tipControl.selectedSegmentIndex]/100)
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }

}

