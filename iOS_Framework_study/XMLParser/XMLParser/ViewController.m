//
//  ViewController.m
//  XMLParser
//
//  Created by lysongzi on 16/1/23.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSXMLParserDelegate>

@property (strong, nonatomic) NSXMLParser *parser;
@property (strong, nonatomic) NSString *buffer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buffer = [[NSString alloc] init];
    
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"xml"]]];
    
    self.parser.delegate = self;
    
    //开始解析
    [self.parser parse];
}

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"开始解析文档");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"完成文档解析");
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    NSLog(@"Start Elements: %@", elementName);
    
    //读取该元素值得属性值
    if ([elementName isEqualToString:@"person"]) {
        NSLog(@"attribute age: %@", attributeDict[@"age"]);
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //输出读取的该元素的数据
    NSLog(@"Data: %@", self.buffer);
    //清空用于存储该元素值的缓冲区
    self.buffer = [[NSString alloc] init];
    
    NSLog(@"End Elements: %@", elementName);
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    self.buffer = [self.buffer stringByAppendingString:string];
}

@end
