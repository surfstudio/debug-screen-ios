//
//  Observable.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation


final class WeakObject {
    weak var object: AnyObject?

    init(object: AnyObject?) {
        self.object = object
    }
}


class Observable<T> {
    private let isSingleObservable: Bool

    var isEnabled: Bool = true
    var value: T {
        didSet {
            if !self.isEnabled {
                return
            }

            self.weakObservers = self.weakObservers.filter{observer in observer.owner.object != nil}

            for observer in self.weakObservers {
                observer.execute(self.value)
            }
        }
    }

    private var weakObservers: [(owner: WeakObject, execute: ((T) -> Void))] = []

    init(_ value: T) {
        self.isSingleObservable = false
        self.value = value
    }

    fileprivate init(_ value: T, isSingleObservable: Bool) {
        self.isSingleObservable = isSingleObservable
        self.value = value
    }

    func addObserver(_ owner: AnyObject,
                     callNow: Bool = true,
                     execute: @escaping ((T) -> Void)) {

        if self.isSingleObservable {
            self.weakObservers = []
        }

        self.weakObservers.append((owner: WeakObject(object: owner), execute: execute))

        if callNow {
            execute(self.value)
        }
    }

    func removeObserver(_ owner: AnyObject) {
        for i in 0..<weakObservers.count {
            if weakObservers[i].owner === owner {
                weakObservers.remove(at: i)
                return
            }
        }
    }

    func removeAllObservers() {
        self.weakObservers = []
    }

    func notifyAllObservers() {
        for observer in self.weakObservers {
            observer.execute(self.value)
        }
    }
}

final class SingleObservable<T>: Observable<T> {
    override init(_ value: T) {
        super.init(value, isSingleObservable: true)
    }
}
