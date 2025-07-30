//
//  RealmStorage.swift
//  GreenStep
//
//  Created by JIN on 7/30/25.
//

import RealmSwift
import UIKit



protocol RealmStorageProtocol {
    var realm: Realm { get }

    func save(item: Object)

    func fetch<T: Object>(_ type: T.Type) -> Results<T>

    func update(_ block: () -> Void)

    func delete(item: Object)
}


extension RealmStorageProtocol {

    func save(item: Object) {
        try? realm.write {
            realm.add(item, update: .modified)
        }
    }


    func fetch<T: Object>(_ type: T.Type) -> Results<T> {
        realm.objects(type)
    }


    func update(_ block: () -> Void) {
        try? realm.write(block)
    }

    func delete(item: Object) {
        try? realm.write {
            realm.delete(item)
        }
    }
}

final class RealmStorage: RealmStorageProtocol {
    let realm: Realm

    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
}
