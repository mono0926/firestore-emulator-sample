//
//  ViewController.swift
//  EmulatorSample
//
//  Created by mono on 2020/03/11.
//  Copyright © 2020 mono. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        Auth.auth().signInAnonymously { (result, error) in
            assert(error == nil)
            
            guard let result = result else {
                assert(false)
                return;
            }
            
            let uid = result.user.uid
            print(uid)
            Firestore.firestore().collection("users").document(uid).getDocument { (snap, error) in
//                "snap: nil"
                print("snap: \(snap?.data())")
//                error: Optional(Error Domain=FIRFirestoreErrorDomain Code=7 "
//                false for 'get' @ L5" UserInfo={NSLocalizedDescription=
//                false for 'get' @ L5})
                print("error: \(error)")
            }
        }
    }
    
}

