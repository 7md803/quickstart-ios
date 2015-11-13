//
// Copyright (c) 2015 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  ViewController.swift
//  AdMobExampleSwift
//

// [START firebase_banner_example]
import UIKit
import Firebase.AdMob

// Makes ViewController available to Objc classes.
@objc(ViewController)
class ViewController: UIViewController, GADInterstitialDelegate {
  @IBOutlet weak var bannerView: GADBannerView!
  var interstitial: GADInterstitial!

  override func viewDidLoad() {
    super.viewDidLoad()

    self.bannerView.adUnitID = FIRContext.sharedInstance().adUnitIDForBannerTest
    self.bannerView.rootViewController = self
    self.bannerView.loadRequest(GADRequest())
    // [END firebase_banner_example]

    // [START firebase_interstitial_example]
    self.interstitial = createAndLoadInterstitial()
  }

  func createAndLoadInterstitial() -> GADInterstitial {
    let interstitial =
        GADInterstitial(adUnitID: FIRContext.sharedInstance().adUnitIDForInterstitialTest)
    interstitial.delegate = self
    interstitial.loadRequest(GADRequest())
    return interstitial
  }

  func interstitialDidDismissScreen(interstitial: GADInterstitial!) {
    self.interstitial = createAndLoadInterstitial()
  }


  @IBAction func didTapInterstitialButton(sender: AnyObject) {
    if (self.interstitial.isReady) {
      self.interstitial.presentFromRootViewController(self)
    }
  }
}
// [END firebase_interstitial_example]
