//
//  ParsePromiseKit.swift
//
//  Created by Angelo Ashmore on 5/31/15.
//  Copyright (c) 2015 Angelo Ashmore. All rights reserved.
//

import Foundation
import PromiseKit
import Parse
import ParseUI

extension PFAnonymousUtils {
    static func promiseLogIn() -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.logInWithBlock(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFCloud {
    static func promiseFunction(function: String, withParameters parameters: Dictionary<NSObject, AnyObject>) -> Promise<AnyObject> {
        return Promise { fulfill, reject in
            self.callFunctionInBackground(function, withParameters: parameters, block: ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFFile {
    func promiseGetData() -> Promise<NSData> {
        return Promise { fulfill, reject in
            self.getDataInBackgroundWithBlock(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    func promiseGetDataStream() -> Promise<NSInputStream> {
        return Promise { fulfill, reject in
            self.getDataStreamInBackgroundWithBlock(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    func promiseSave() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.saveInBackgroundWithBlock(ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFGeoPoint {
    static func promiseGeoPointForCurrentLocation() -> Promise<PFGeoPoint> {
        return Promise { fulfill, reject in
            self.geoPointForCurrentLocationInBackground(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFObject {
    func promiseFetch() -> Promise<PFObject> {
        return Promise { fulfill, reject in
            self.fetchInBackgroundWithBlock(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    func promiseFetchIfNeeded() -> Promise<PFObject> {
        return Promise { fulfill, reject in
            self.fetchIfNeededInBackgroundWithBlock(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseFetchAll(objects: Array<PFObject>) -> Promise<Array<AnyObject>> {
        return Promise { fulfill, reject in
            self.fetchAllInBackground(objects, block: ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseFetchAllIfNeeded(objects: Array<PFObject>) -> Promise<Array<AnyObject>> {
        return Promise { fulfill, reject in
            self.fetchAllIfNeededInBackground(objects, block: ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    func promiseSave() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.saveInBackgroundWithBlock(ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseSaveAll(objects: Array<PFObject>) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.saveAllInBackground(objects, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    func promiseDelete() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.deleteInBackgroundWithBlock(ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseDeleteAll(objects: Array<PFObject>) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.deleteAllInBackground(objects, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFQuery {
    static func promiseGetObjectOfClass(objectClass: String, objectId: String) -> Promise<PFObject> {
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

    func promiseGetObjectWithId(objectId: String) -> Promise<PFObject> {
        return Promise { fulfill, reject in
            self.getObjectInBackgroundWithId(objectId, block: ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseGetUserObjectWithId(objectId: String) -> Promise<PFObject> {
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

    func promiseFindObjects() -> Promise<[AnyObject]> {
        return Promise { fulfill, reject in
            self.findObjectsInBackgroundWithBlock(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    func promiseGetFirstObject() -> Promise<PFObject> {
        return Promise { fulfill, reject in
            self.getFirstObjectInBackgroundWithBlock(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    func promiseCountObjects() -> Promise<Int32> {
        return Promise { fulfill, reject in
            self.countObjectsInBackgroundWithBlock(ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFUser {
    func promiseSignUp() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.signUpInBackgroundWithBlock(ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseBecome(sessionToken: String) -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.becomeInBackground(sessionToken, block: ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseLogInWithUsername(username: String, password: String) -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.logInWithUsernameInBackground(username, password: password, block: ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseRequestPasswordResetForEmail(email: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.requestPasswordResetForEmailInBackground(email, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    public static func promiseLogOut() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.logOutInBackgroundWithBlock(ParsePromiseKitClosures.ErrorPassthroughBlock(fulfill: fulfill, reject: reject, passthrough: true))
        }
    }
}

extension PFImageView {
    func promiseLoad() -> Promise<UIImage> {
        return Promise { fulfill, reject in
            self.loadInBackground(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFPurchase {
    static func promiseBuyProduct(productIdentifier: String) -> Promise<String> {
        return Promise { fulfill, reject in
            self.buyProduct(productIdentifier, block: ParsePromiseKitClosures.ErrorPassthroughBlock(fulfill: fulfill, reject: reject, passthrough: productIdentifier))
        }
    }

    static func promiseDownloadAssetForTransaction(transaction: SKPaymentTransaction) -> Promise<String> {
        return Promise { fulfill, reject in
            self.downloadAssetForTransaction(transaction, completion: ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFPush {
    static func promiseSendPushMessageToChannel(channel: String, withMessage message: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushMessageToChannelInBackground(channel, withMessage: message, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseSendPushMessageToQuery(query: PFQuery, withMessage message: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushMessageToQueryInBackground(query, withMessage: message, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    func promiseSendPush() -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushInBackgroundWithBlock(ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseSendPushDataToChannel(channel: String, withData data: [NSObject: AnyObject]) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushDataToChannelInBackground(channel, withData: data, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseSendPushDataToQuery(query: PFQuery, withData data: [NSObject: AnyObject]) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.sendPushDataToQueryInBackground(query, withData: data, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseGetSubscribedChannels() -> Promise<Set<NSObject>> {
        return Promise { fulfill, reject in
            self.getSubscribedChannelsInBackgroundWithBlock(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseSubscribeToChannel(channel: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.subscribeToChannelInBackground(channel, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseUnsubscribeFromChannel(channel: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.unsubscribeFromChannelInBackground(channel, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}

extension PFTwitterUtils {
    static func promiseLogIn() -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.logInWithBlock(ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseLogInWithTwitterId(twitterId: String, screenName: String, authToken: String, authTokenSecret: String) -> Promise<PFUser> {
        return Promise { fulfill, reject in
            self.logInWithTwitterId(twitterId, screenName: screenName, authToken: authToken, authTokenSecret: authTokenSecret, block: ParsePromiseKitClosures.OptionalResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseLinkUser(user: PFUser) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.linkUser(user, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseLinkUser(user: PFUser, twitterId: String, screenName: String, authToken: String, authTokenSecret: String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.linkUser(user, twitterId: twitterId, screenName: screenName, authToken: authToken, authTokenSecret: authTokenSecret, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }

    static func promiseUnlinkUser(user: PFUser) -> Promise<Bool> {
        return Promise { fulfill, reject in
            self.unlinkUserInBackground(user, block: ParsePromiseKitClosures.ResultBlock(fulfill: fulfill, reject: reject))
        }
    }
}
