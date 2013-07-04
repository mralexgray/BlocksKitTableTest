
#import <BlocksKit/BlocksKit.h>

@interface 							AppDelegate : NSObject
@property (assign) IBOutlet 	NSTableView * tv;
@property (strong) 		A2DynamicDelegate * ddSource;						@end

@implementation AppDelegate

- (void)awakeFromNib 	{

	_ddSource	 	= _tv.dynamicDataSource;									logObject(_ddSource);
	_tv.dataSource	= (id<NSTableViewDataSource>)_ddSource;				logObject(_tv.dataSource);

	SEL rowSEL = @selector					 (numberOfRowsInTableView:);
	SEL objSEL = @selector(tableView:objectValueForTableColumn:row:);

	NSInteger(^reqIMP1)(NSTableView*) =
  ^NSInteger			 (NSTableView*v)	{ return 9; };

	 id(^reqIMP2)(NSTableView*, NSTableColumn*, NSInteger) =
   ^id 			 (NSTableView*v,NSTableColumn*c,NSInteger r) { return @"DOESNT WORK!"; };

	[_ddSource implementMethod:rowSEL withBlock:reqIMP1];
	[_ddSource implementMethod:objSEL withBlock:reqIMP2];
	[_tv reloadData];
}																								@end

int main(int argc, const char * argv[])	{	return NSApplicationMain(argc, argv);	}
