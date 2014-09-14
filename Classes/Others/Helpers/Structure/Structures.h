//
//  Structures.h
//  InclinIQ
//
//  Created by Gagan on 08/09/14.
//  Copyright (c) 2014 Ace. All rights reserved.
//

#import <Foundation/Foundation.h>

//Request
@interface loginRequestStruct  : NSObject
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *password;
@end

@interface doctorStuct : NSObject
@property (nonatomic,strong) NSString *fname;
@property (nonatomic,strong) NSString *lname;
@property (atomic) int specializationId;
@property (atomic) int doctorId;
@property (nonatomic,strong) NSString *specializationName;
@end

@interface specialisationStruct : NSObject
@property (nonatomic,strong) NSString *abbrevation;
@property (nonatomic,strong) NSString *name;
@property (atomic) int Id;
@end

@interface eDetailor : NSObject
@property (nonatomic,strong) NSString *brandName;
@property (atomic) int noOfSlides;
@property (nonatomic,strong) NSString *versionNo;
@property (atomic) int Id;
@end

@interface schedule : NSObject
@property (nonatomic,strong) NSString *datetime;
@property (nonatomic,strong) NSString *ActionDate;
@property (nonatomic,strong) NSString *CallType;
@property (nonatomic,strong) NSString *CallObjective;
@property (nonatomic,strong) NSString *ActionBy;
@end


@interface ScheduleCall : NSObject
@property (atomic) int ScheduleId;
@property (atomic) int DoctorId;
@property (nonatomic,strong) NSString *DoctorName;
@property (nonatomic,strong) NSString *ActionDate;
@property (nonatomic,strong) NSString *ActionBy;
@end

@interface ScheduleContent : NSObject
@property (atomic) int EdetailerId;
@property (atomic) int ScheduleId;
@property (nonatomic,strong) NSString *ActionDate;
@property (nonatomic,strong) NSString *ActionBy;
@end

typedef enum tables
{
    Schedule_tbl,
    ScheduleCall_tbl,
    ScheduleContent_tbl,
    
}tblName;
