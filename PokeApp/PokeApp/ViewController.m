//
//  ViewController.m
//  PokeApp
//
//  Created by Antonio Alves on 9/21/15.
//  Copyright © 2015 Antonio Alves. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pokeTable.delegate = self;
    [self req];

    self.ps = [[NSMutableArray alloc] init];
    
    
    
    //Image to background
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[self imageResize:[UIImage imageNamed:@"bg1.png"] andResizeTo:self.view.frame.size]];
    self.pokeTable.backgroundColor = [UIColor clearColor];
    
    
    //Image on Navigation Controller
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *image = [UIImage imageNamed:@"logo.png"];
    [imageView setImage:image];
    self.navigationItem.titleView = imageView;

    

    
    
}
-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    CGFloat scale = [[UIScreen mainScreen]scale];
    
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (void)req {
        
    NSMutableArray *array = [NSMutableArray array];
    for(int i=1; i<151; i++) {
        [array addObject:@(i)];
    }
    NSMutableArray *ar = [[NSMutableArray alloc] init];
    for (NSNumber *n in array) {
        ar = [self loadPokemonsAtIndex:n];
    }
}


- (NSMutableArray *)loadPokemonsAtIndex:(NSNumber *)index {
    
    NSString *urlString = [NSString stringWithFormat:@"http://pokeapi.co/api/v1/pokemon/%@/", index];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *p = responseObject;
        Pokemon *pokemon = [[Pokemon alloc] init];
        pokemon.name = [p objectForKey:@"name"];
        pokemon.specie = [p objectForKey:@"species"];
        pokemon.aid = [[p objectForKey:@"national_id"] intValue];
        
        NSArray *types = [p objectForKey:@"types"];
        NSDictionary *typeName = [types objectAtIndex:0];
        pokemon.type = [typeName objectForKey:@"name"];
        [self.ps addObject:pokemon];
        [self.pokeTable reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Falha" message:@"Error na requisição" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
    
    [operation start];
    return self.ps;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.ps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    
    Pokemon *poke = [self.ps objectAtIndex:row];
    
    cell.textLabel.text = poke.name;
    
    cell.imageView.image = [UIImage imageNamed:@"pokeball2"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"]) {
        NSIndexPath *indexPath = [self.pokeTable indexPathForSelectedRow];
        DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;
        Pokemon *pokeDetail = [self.ps objectAtIndex:indexPath.row];
        detailViewController.detailaid = [NSString stringWithFormat:@"#00%u", pokeDetail.aid];
        detailViewController.detailN = pokeDetail.name;
        detailViewController.detailSpecies = pokeDetail.specie;
        detailViewController.detailTypes = pokeDetail.type;
        detailViewController.title = pokeDetail.name;
    }
}




@end
