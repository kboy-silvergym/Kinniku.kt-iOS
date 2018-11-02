//
//  CloudFirestore.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Firebase
import FirebaseFirestore
import Unbox

class CloudFirestore {
    var defaultStore = Firestore.firestore()

    func voteSpeaker(id: String?, newCount: Int){
        guard let id = id else {
            assertionFailure("id入ってないやで")
            return
        }
        
        defaultStore
            .collection("Speaker")
            .document(id)
            .setData(["point": newCount], merge: true) { error in
                
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
        }
    }
    
    func getSpeaker(_ completion: @escaping (Error?, [Speaker]) -> Void){
        let ref = defaultStore.collection("Speaker")
        ref.getDocuments(completion: { (querySnapshot, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            var speakers: [Speaker] = []
            querySnapshot?.documents.forEach({ doc in
                
                if let speaker: Speaker = try? unbox(dictionary: doc.data()){
                    speakers.append(speaker)
                }
            })
            completion(error, speakers)
        })
    }
    
    func getSpeakerRealtime(_ completion: @escaping (Error?, [Speaker]) -> Void){
        let ref = defaultStore.collection("Speaker")
        ref.addSnapshotListener({ snapshot, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            var speakers: [Speaker] = []
            snapshot?.documents.forEach({ doc in
                
                if let speaker: Speaker = try? unbox(dictionary: doc.data()){
                    speaker.setId(doc.documentID)
                    speakers.append(speaker)
                }
            })
            completion(error, speakers)
        })
    }
    
    func getSponsor(_ completion: @escaping (Error?, [Sponsor]) -> Void){
        let ref = defaultStore.collection("Sponcer")
        ref.getDocuments(completion: { (querySnapshot, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            var sponsors: [Sponsor] = []
            querySnapshot?.documents.forEach({ doc in
                
                if let sponsor: Sponsor = try? unbox(dictionary: doc.data()){
                    sponsors.append(sponsor)
                }
            })
            completion(error, sponsors)
        })
    }
    
    func getPersonalSponsor(_ completion: @escaping (Error?, [PersonalSponsor]) -> Void){
        let ref = defaultStore.collection("PersonalSponcer")
        ref.getDocuments(completion: { (querySnapshot, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            var sponsors: [PersonalSponsor] = []
            querySnapshot?.documents.forEach({ doc in
                
                if let sponsor: PersonalSponsor = try? unbox(dictionary: doc.data()){
                    sponsors.append(sponsor)
                }
            })
            completion(error, sponsors)
        })
    }
    
    func getEvent(_ completion: @escaping (Error?, [Event]) -> Void){
        let ref = defaultStore.collection("Event")
        ref.getDocuments(completion: { (querySnapshot, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            var events: [Event] = []
            querySnapshot?.documents.forEach({ doc in
                
                if let event: Event = try? unbox(dictionary: doc.data()){
                    events.append(event)
                }
            })
            completion(error, events)
        })
    }
}
