//
//  HelpController.m
//  HILab1.0
//
//  Created by dengwt on 2017/5/26.
//  Copyright © 2017年 dengwt. All rights reserved.
//

#import "HelpController.h"

@interface HelpController ()

@end

@implementation HelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"Help";
    UILabel *help=[[UILabel alloc]initWithFrame:CGRectMake(30, 120, 360, 300)];
    help.numberOfLines=0;
    help.text=@"GeneCards is a searchable, integrative database that provides comprehensive, user-friendly information on all annotated and predicted human genes. It automatically integrates gene-centric data from ~125 web sources, including genomic, transcriptomic, proteomic, genetic, clinical and functional information.My Genes is a facility (registration required) where you can manage your list of favorite genes. Genes can be added or removed to/from the list by clicking the My Genes asterisk on each GeneCards gene's webcard.Clicking on My Genes from the menu brings up a page containing a Search box and a list of genes. Each gene is linked to its GeneCard, associated with editable commentary, and annotated with the date that it joined the list.";
    [help sizeToFit];
    [self.view addSubview:help];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
