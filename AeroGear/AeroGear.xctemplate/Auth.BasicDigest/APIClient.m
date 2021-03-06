// APIClient.m
//
//  Generated by the the JBoss AeroGear Xcode Project Template on ___DATE___.
//  See Project's web site for more details http://www.aerogear.org
//

#import "APIClient.h"

static NSString * const kAPIBaseURLString = @"<# Service URL #>";

@implementation APIClient

@synthesize pipe = _pipe;

+ (APIClient *)sharedInstance {
    static APIClient *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        NSURL *baseURL = [NSURL URLWithString:kAPIBaseURLString];

        // create the Pipeline object 
        AGPipeline *pipeline = [AGPipeline pipelineWithBaseURL:baseURL];

        _pipe = [pipeline pipe:^(id<AGPipeConfig> config) {
            [config setName:@"<# Endpoint Name #>"]; 
            // apply credentials for basic/digest authentication
            [config setCredential:[NSURLCredential
                credentialWithUser:@"<# Username #>" password:@"<# Password #>" persistence:NSURLCredentialPersistenceNone]];            
        }];
        // ..add your own pipes here
    }

    return (self);
}

@end