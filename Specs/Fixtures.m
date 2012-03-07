#import "Fixtures.h"
#import "BSInitializer.h"

@implementation State
@end

@implementation City 
@end

@implementation Garage 
@end

@implementation Driveway 
@end

@implementation Address : NSObject

@synthesize 
street = street_,
city = city_,
state = state_,
zip = zip_;

+ (BSInitializer *)blindsideInitializer {
    return [BSInitializer initializerWithClass:self selector:@selector(initWithStreet:city:state:zip:) 
                                  argumentKeys:@"street", @"city", @"state", @"zip", nil];
}

- (id)initWithStreet:(NSString *)street city:(City *)city state:(State *)state zip:(NSString *)zip {
    if (self = [super init]) {
        self.street = street;
        self.city = city;
        self.state = state;
        self.zip = zip;
    }
    return self;
}

- (void)dealloc {
    self.street = nil;
    self.city = nil;
    self.state = nil;
    self.zip = nil;
    [super dealloc];
}

@end

@implementation House : NSObject

@synthesize 
address = address_, 
garage = garage_,
driveway = driveway_;

+ (BSInitializer *)blindsideInitializer {
    return [BSInitializer initializerWithClass:self selector:@selector(initWithAddress:) argumentKeys:[Address class], nil];
}

+ (NSDictionary *)blindsideProperties {
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [Garage class], @"garage", 
            [Driveway class], @"driveway", 
            nil];
}

- (id)initWithAddress:(Address *)address {
    if (self = [super init]) {
        self.address = address;
    }
    return self;
}

- (void)dealloc {
    self.address = nil;
    self.garage = nil;
    self.driveway = nil;
    [super dealloc];
}

@end
