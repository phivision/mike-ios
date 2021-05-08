//
//  HealthKitTools.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/8.
//

import UIKit
import HealthKit

class HealthKitTools: NSObject {
    static let sharedTools = HealthKitTools()
    let healthKitStore:HKHealthStore = HKHealthStore()
    private override init() {
        super.init()
    }
    //Here is access
    func authorizeHealthKit(completion: ((_ success:Bool, _ error:NSError?) -> Void)!){
        // Data to be obtained date of birth blood type sex weight height
        let healthKitTypesToRead = NSSet(array:[
            HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth) as Any ,
            HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.bloodType) as Any,
            HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex) as Any,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass) as Any,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height) as Any,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) as Any,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryWater) as Any,
            HKObjectType.workoutType()
            ])
        
        //Data to be written
        let healthKitTypesToWrite = NSSet(array:[
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMassIndex) as Any,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned) as Any,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning) as Any,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) as Any,
            HKQuantityType.workoutType()
            ])
        
        // Can health be used
        if !HKHealthStore.isHealthDataAvailable()
        {
            let error = NSError(domain: "com.raywenderlich.tutorials.healthkit", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            if( completion != nil )
            {
                completion(false, error)
            }
            return;
        }
        // to grant authorization
        healthKitStore.requestAuthorization(toShare: healthKitTypesToWrite as? Set<HKSampleType>, read: healthKitTypesToRead as? Set<HKObjectType>) { (success, error) in
            if( completion != nil )
            {
                completion(success, error as NSError?)
            }
        };
    }
    //获取身高
    func getHeight(completion: ((_ success:Bool,_ height:Double, _ error:NSError?) -> Void)!){
        //出事话一个HKSampleSortIdentifierEndDate为key的降序，这样会得到一个用户存储在health sore中的最新的的体重取样
        let sort:NSSortDescriptor = NSSortDescriptor.init(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query =  HKSampleQuery.init(sampleType: HKSampleType.quantityType(forIdentifier: .height)!, predicate: nil, limit: 1, sortDescriptors: [sort], resultsHandler: { (query, results, error) in
            if(results?.count ?? 0 > 0){
                let sameple = results?[0] as! HKQuantitySample
                let height = sameple.quantity.doubleValue(for: HKUnit.meter())
                completion(true,height,nil)
            }else{
                completion(false,0,error as NSError?)
            }
        })
        healthKitStore.execute(query)
    }
    //获取体重
    func getBodyMass(completion: ((_ success:Bool,_ bodyMass:Double, _ error:NSError?) -> Void)!){
        //出事话一个HKSampleSortIdentifierEndDate为key的降序，这样会得到一个用户存储在health sore中的最新的的体重取样
        let sort:NSSortDescriptor = NSSortDescriptor.init(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query =  HKSampleQuery.init(sampleType: HKSampleType.quantityType(forIdentifier: .bodyMass)!, predicate: nil, limit: 1, sortDescriptors: [sort], resultsHandler: { (query, results, error) in
            if(results?.count ?? 0 > 0){
                let sameple = results?[0] as! HKQuantitySample
                let bodyMass = sameple.quantity.doubleValue(for: HKUnit.init(from: "kg"))
                completion(true,bodyMass,nil)
            }else{
                completion(false,0,error as NSError?)
            }
        })
        healthKitStore.execute(query)
    }
    //获取体重
    func getWater(completion: ((_ success:Bool,_ water:Double, _ error:NSError?) -> Void)!){
        //出事话一个HKSampleSortIdentifierEndDate为key的降序，这样会得到一个用户存储在health sore中的最新的的体重取样
        let sort:NSSortDescriptor = NSSortDescriptor.init(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query =  HKSampleQuery.init(sampleType: HKSampleType.quantityType(forIdentifier: .dietaryWater)!, predicate: nil, limit: 1, sortDescriptors: [sort], resultsHandler: { (query, results, error) in
            if(results?.count ?? 0 > 0){
                let sameple = results?[0] as! HKQuantitySample
                let water = sameple.quantity.doubleValue(for: HKUnit.init(from: "ml"))
                completion(true,water,nil)
            }else{
                completion(false,0,error as NSError?)
            }
        })
        healthKitStore.execute(query)
    }
    //获取步数
    func getStepCount(completion: ((_ success:Bool,_ stepCount:Double, _ error:NSError?) -> Void)!) {
            HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
            //NSSortDescriptors用来告诉healthStore怎么样将结果排序
            let start = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
            let stop  = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            let now = Date()
            guard let sampleType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) else {
                fatalError("*** This method should never fail ***")
            }
            
            let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
            var dataCom = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
            let endDate = calendar.date(from: dataCom)    //设置查询的截止时间(当前)
            dataCom.hour = 0
            dataCom.minute = 0
            dataCom.second = 0
            let startDate = calendar.date(from: dataCom)    //设置查询的起始时间(当天0点)
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: HKQueryOptions.strictStartDate)
            
            var localSum: Double = 0  //手机写入步数
            var currentDeviceSum: Double = 0  //软件写入步数
            let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [start, stop]) { (query, results, error) in
                
                guard (results as? [HKQuantitySample]) != nil else {
    //                fatalError("An error occured fetching the user's tracked food. In your app, try to handle this error gracefully. The error was: \(String(describing: error?.localizedDescription))");
                    print("获取步数error ---> \(String(describing: error?.localizedDescription))")
                    return
                }
                for res in results! {
                    // res.sourceRevision.source.bundleIdentifier  当前数据来源的BundleId
                    // Bundle.main.bundleIdentifier  当前软件的BundleId
                    if res.sourceRevision.source.bundleIdentifier == Bundle.main.bundleIdentifier {
                        print("app写入数据")
                        let _res = res as? HKQuantitySample
                        currentDeviceSum = currentDeviceSum + (_res?.quantity.doubleValue(for: HKUnit.count()))!
                    }else {     //手机录入数据
                        let _res = res as? HKQuantitySample
                        localSum = localSum + (_res?.quantity.doubleValue(for: HKUnit.count()))!
                    }
                }
                completion(true,localSum,nil)
    //            DispatchQueue.main.async { [weak self] in
    //
    //            }
            }
            healthKitStore.execute(query)   //开始查询
    }
}
