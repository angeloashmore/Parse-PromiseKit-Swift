//
//  ParsePromiseKit.swift
//
//  Created by Angelo Ashmore on 5/31/15.
//  Copyright (c) 2015 Angelo Ashmore. All rights reserved.
//

import Foundation
import PromiseKit
import PromiseKitClosures
import Parse
import ParseUI

extension PFAnonymousUtils {
    public static func promiseLogIn() -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.logInWithBlock(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFCloud {
    public static func promiseFunction(function: String, withParameters parameters: Dictionary<NSObject, AnyObject>) -> Promise<AnyObject> {
        return Promise { fulfill, reject in
            self.callFunctionInBackground(function, withParameters: parameters, block: PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFFile {
    public func promiseGetData() -> Promise<NSData> {
        return Promise { fulfill, reject in
            self.getDataInBackgroundWithBlock(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public func promiseGetDataStream() -> Promise<NSInputStream> {
        return Promise { fulfill, reject in
            self.getDataStreamInBackgroundWithBlock(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public func promiseSave() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.saveInBackgroundWithBlock(PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFGeoPoint {
    public static func promiseGeoPointForCurrentLocation() -> Promise<PFGeoPoint> {
        return Promise { fulfill, reject in
            self.geoPointForCurrentLocationInBackground(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFObject {
    public func promiseFetch() -> Promise<PFObject> {
        return Promise { fulfill, reject in
            self.fetchInBackgroundWithBlock(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public func promiseFetchIfNeeded() -> Promise<PFObject> {
        return Promise { fulfill, reject in
            self.fetchIfNeededInBackgroundWithBlock(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseFetchAll(objects: Array<PFObject>) -> Promise<Array<AnyObject>> {
        return Promise { fulfill, reject in
            self.fetchAllInBackground(objects, block: PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseFetchAllIfNeeded(objects: Array<PFObject>) -> Promise<Array<AnyObject>> {
        return Promise { fulfill, reject in
            self.fetchAllIfNeededInBackground(objects, block: PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public func promiseSave() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.saveInBackgroundWithBlock(PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseSaveAll(objects: Array<PFObject>) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.saveAllInBackground(objects, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public func promiseDelete() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.deleteInBackgroundWithBlock(PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseDeleteAll(objects: Array<PFObject>) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.deleteAllInBackground(objects, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFQuery {
    public static func promiseGetObjectOfClass(objectClass: String, objectId: String) -> Promise<PFObject> {
        return Promise { fulfill, reject in
            var error: NSError?

                let object = self.getObjectOfClass(objectClass, objectId: objectId, error: &error)

                if let object = object {
                    fulfill(object)
                } else {
                    reject(error!)
                }
        }
    }

    public func promiseGetObjectWithId(objectId: String) -> Promise<PFObject> {
        return Promise { fulfill, reject in
            self.getObjectInBackgroundWithId(objectId, block: PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseGetUserObjectWithId(objectId: String) -> Promise<PFObject> {
        return Promise { fulfill, reject in
            var error: NSError?

                let object = self.getUserObjectWithId(objectId, error: &error)

                if let object = object {
                    fulfill(object)
                } else {
                    reject(error!)
                }
        }
    }

    public func promiseFindObjects() -> Promise<[AnyObject]> {
        return Promise { fulfill, reject in
            self.findObjectsInBackgroundWithBlock(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public func promiseGetFirstObject() -> Promise<PFObject> {
        return Promise { fulfill, reject in
            self.getFirstObjectInBackgroundWithBlock(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public func promiseCountObjects() -> Promise<Int32> {
        return Promise { fulfill, reject in
            self.countObjectsInBackgroundWithBlock(PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFUser {
    public func promiseSignUp() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.signUpInBackgroundWithBlock(PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseBecome(sessionToken: String) -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.becomeInBackground(sessionToken, block: PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseLogInWithUsername(username: String, password: String) -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.logInWithUsernameInBackground(username, password: password, block: PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseRequestPasswordResetForEmail(email: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.requestPasswordResetForEmailInBackground(email, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseLogOut() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.logOutInBackgroundWithBlock(PromiseKitClosures.PassthroughBlock(fulfill: fulfill, reject: reject, passthrough: true))
        }
    }
}

extension PFImageView {
    public func promiseLoad() -> Promise<UIImage> {
        return Promise { fulfill, reject in
            self.loadInBackground(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFPurchase {
    public static func promiseBuyProduct(productIdentifier: String) -> Promise<String> {
        return Promise { fulfill, reject in
            self.buyProduct(productIdentifier, block: PromiseKitClosures.PassthroughBlock(fulfill: fulfill, reject: reject, passthrough: productIdentifier))
        }
    }

    public static func promiseDownloadAssetForTransaction(transaction: SKPaymentTransaction) -> Promise<String> {
        return Promise { fulfill, reject in
            self.downloadAssetForTransaction(transaction, completion: PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFPush {
    public static func promiseSendPushMessageToChannel(channel: String, withMessage message: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushMessageToChannelInBackground(channel, withMessage: message, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseSendPushMessageToQuery(query: PFQuery, withMessage message: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushMessageToQueryInBackground(query, withMessage: message, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public func promiseSendPush() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushInBackgroundWithBlock(PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseSendPushDataToChannel(channel: String, withData data: [NSObject: AnyObject]) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushDataToChannelInBackground(channel, withData: data, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseSendPushDataToQuery(query: PFQuery, withData data: [NSObject: AnyObject]) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushDataToQueryInBackground(query, withData: data, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseGetSubscribedChannels() -> Promise<Set<NSObject>> {
        return Promise { fulfill, reject in
            self.getSubscribedChannelsInBackgroundWithBlock(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseSubscribeToChannel(channel: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.subscribeToChannelInBackground(channel, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseUnsubscribeFromChannel(channel: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.unsubscribeFromChannelInBackground(channel, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFTwitterUtils {
    public static func promiseLogIn() -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.logInWithBlock(PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseLogInWithTwitterId(twitterId: String, screenName: String, authToken: String, authTokenSecret: String) -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.logInWithTwitterId(twitterId, screenName: screenName, authToken: authToken, authTokenSecret: authTokenSecret, block: PromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseLinkUser(user: PFUser) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.linkUser(user, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseLinkUser(user: PFUser, twitterId: String, screenName: String, authToken: String, authTokenSecret: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.linkUser(user, twitterId: twitterId, screenName: screenName, authToken: authToken, authTokenSecret: authTokenSecret, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseUnlinkUser(user: PFUser) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.unlinkUserInBackground(user, block: PromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}
