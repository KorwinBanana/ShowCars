//
//  CarViewController.m
//  展示汽车数据
//
//  Created by korwin on 2017/8/4.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import "CarViewController.h"
#import "CarGroup.h"
#import "KWCar.h"

@interface CarViewController ()

//所有车的数据
@property (nonatomic,strong) NSArray *CarGroup;

@end

@implementation CarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.backgroundColor = [UIColor redColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView = [[UITableView alloc] initWithFrame:self.tableView.frame style:UITableViewStyleGrouped];
}

- (NSArray *) CarGroup {
    if (!_CarGroup) {
//        CarGroup *group0 = [[CarGroup alloc] init];
//        group0.header = @"德系车型";
//        group0.footer = @"德系品牌GUGUGUGUGU";
//        group0.cars = @[
//                       [KWCar carWithName:@"奔驰" icon:@"m_2_100"],
//                       [KWCar carWithName:@"宝马" icon:@"m_3_100"]
//                       ];
//        
//        CarGroup *group1 = [[CarGroup alloc] init];
//        group1.header = @"日系车型";
//        group1.footer = @"日系品牌TOTOTOTOTO";
//        group1.cars = @[
//                       [KWCar carWithName:@"丰田" icon:@"m_7_100"],
//                       [KWCar carWithName:@"马自达" icon:@"m_18_100"],
//                       [KWCar carWithName:@"本田" icon:@"m_26_100"]
//                       ];
//        
//        CarGroup *group2 = [[CarGroup alloc] init];
//        group2.header = @"天系车型";
//        group2.footer = @"天系品牌CACACACACA";
//        group2.cars = @[
//                       [KWCar carWithName:@"比亚迪" icon:@"m_15_100"]
//                       ];
//        _CarGroup = @[group0,group1,group2];
        
        //1.创建字典数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        
        NSLog(@"%@",dictArray);
        
        //2.创建模型数据
        NSMutableArray *temp = [NSMutableArray array];
        
        //3.数据字典 -> 模型数组
        for (NSDictionary *carGroupDict in dictArray) {
            CarGroup *group = [CarGroup carGroupWithdict:carGroupDict];
            [temp addObject:group];
        }
        _CarGroup = temp;
    }
    
    return _CarGroup;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.CarGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CarGroup *group = self.CarGroup[section];
    return group.cars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //取出组模型
    CarGroup *group = self.CarGroup[indexPath.section];
    
    //取出车模型
    KWCar *car = group.cars[indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    // Configure the cell...
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CarGroup *group = self.CarGroup[section];
    return group.title;
}

//- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    CarGroup *group = self.CarGroup[section];
//    return group.footer;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
