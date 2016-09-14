//
//  ViewController.m
//  ParsHTML
//
//  Created by Jerry on 16/1/7.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "NSAttributedString+Label.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 加载本地json.text
    /*
    NSString * path = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"txt"];
    
    NSData * data = [[NSData alloc] initWithContentsOfFile:path];
    
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingAllowFragments
                                                error:nil];
    NSString * string = [NSString stringWithFormat:@"%@", json[@"detail"][@"content"]];
    
    NSAttributedString * content = [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding]
                                                                    options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                         documentAttributes:nil
                                                                      error:nil];
    
    NSLog(@"content : %@", content);
    self.textView.attributedText = [NSAttributedString attributedStringWithHTML:string];
    */
    
    // 加载本地tt.html
    NSString * path = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"txt"];
    
    NSData * data = [[NSData alloc] initWithContentsOfFile:path];
    
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingAllowFragments
                                                error:nil];
//    NSString * string = [NSString stringWithFormat:@"%@", json[@"detail"][@"content"]];
//    NSString * string = @"<h1>Header</h1><h2>Subheader</h2><p>Some <em>text</em></p><img src='http://a.dilcdn.com/bl/wp-content/uploads/sites/8/2014/06/Screen-Shot-2014-06-23-at-9.26.02-PM-624x348.png' width=624 height=348 />";
    
    NSString * string = @"<h2><strong><span style=\"font-family:新宋体\"></span></strong></h2><h2>更新一：<br/></h2><h3><span style=\"font-size: 16px;\">因为有你，她收到了一份最温暖的跨年礼物</span></h3><p>2015年12月29日21点，我们为刘奶奶组织的众筹正式上线。<br/></p><p>项目上线不到半小时，众筹就成功了！<br/></p><p>不到48小时，我们就收到了超过1000人的支持！<br/></p><p>我和栏目组的同事们都非常惊讶！没想到，在全国各个角落，有这么多和刘奶奶一样，心系中国沙暴源头的你！<br/></p><p>在这里，我首先要感谢你对刘奶奶和梭梭树项目的支持！因为有你们，刘奶奶种梭梭的梦想得以实现。<br/></p><p>项目上线后，我与很多关心刘奶奶的支持者取得了联系。<br/></p><p>大家不仅仅支持刘奶奶的这次众筹，还集思广益为我们提供了很多建设性的意见，我们非常感动！<br/></p><p>由于最后一档很快满额，很多朋友希望能够增加参与名额。不过遗憾的是，考虑到刘奶奶所居住的地区偏远，路途遥远，栏目组需要充分保证所有支持者的安全，20人的队伍已经是一个上限。我们最终还是没有选择增加名额。希望大家理解。</p><p>再次感谢来自全国各地的朋友，在2015年的最后，送给刘奶奶这样一份美好又温暖的跨年礼物。</p><p>也祝所有关心刘奶奶和阿拉善荒漠的你，新年快乐！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; 张萌 &nbsp; &nbsp;</p><p style=\"text-align: right;\">2015年12月31日</p><h2>我的自述：</h2><h3>我与荒漠守望者</h3><p><strong><span style=\"font-family:新宋体\"><img src=\"http://images.kaistart.com/14515723508.png\"/></span></strong></p><p><br/></p><p>一个年过六旬的老人，独自面对一万五千亩荒漠，坚持了一千八百二十五个日夜，种下了十五万棵梭梭树……这是我第一次见到她，在同事从阿拉善带回的影像中。</p><p><br/></p><p>2015年12月22日，我第二次见到她。在北京西站出站口，这个66岁来自草原的老人抻抻衣角，带着羞涩的微笑，用不太熟练的普通话跟我道好。</p><p><br/></p><p>与同事镜头下那个坚韧倔强的老人形象完全不同，她让我感到亲近，就像一个可爱的邻家奶奶。然而，谁又能想得到，这样一个腿脚不太好的老人，却在一万五千亩的阿拉善荒漠之上，八年，独自一人种了三千亩梭梭树。</p><p><br/></p><p><img src=\"http://images.kaistart.com/14515723519.png\"/></p><p>我是张萌，80后，旅游卫视《善·行天下》栏目制片主任。</p><p><br/></p><p>2014年初，我所在的《善·行天下》栏目组成立了“善行者励志帮扶计划”，从全国各地选出最有代表的十个善行人物，进行 跟踪采访和拍摄，制作十个展映短片。我们联动各路媒体发现身边的善行者，并通过影像传播给更多人，进而来帮助善行者解决问题，实现他们小而美的公益梦想。</p><p><br/></p><p>2015年9月28日，《善·行天下》的摄制组第一次走进了阿拉善盟。这里是中国最大的沙尘暴策源地，也是北京沙尘暴的主要源头。曾经的草场现在沙土裸露，只剩下零星的矮小植物。</p><p><br/></p><p>方圆一百多公里只有一户人家，一个简陋的土坯小院，推开门老人却不在。最终，在院子附近的一片梭梭林，我们找到了这个媒体笔下的种梭老人刘金香。</p><p><span style=\"font-size:14px;font-family:新宋体\"></span><br/></p><p><span style=\"font-size:14px;font-family:新宋体\"><img src=\"http://images.kaistart.com/145157235210.png\"/></span></p><p><span style=\"font-size:14px;font-family:新宋体\"></span></p><h5 style=\"text-align: center;\">刘金香在梭梭林</h5><p><br/></p><p>1949年，刘金香出生在甘肃。</p><p><br/></p><p>19岁那年，父母把她许给了一个阿拉善的牧民。于是，带着所有嫁妆，她骑了五天五夜的骆驼，从老家甘肃民勤县到达内蒙古阿拉善。从此，阿拉善成了她的家。</p><p><br/></p><p>60年代末的阿拉善是草丰羊肥的美丽牧场。刘金香和丈夫在生产队干活，挖井、砌羊 圈、放羊。那时候的阿拉善盟有大几百户人家。牧场周围长着大片的野生梭梭林。在大面积梭梭林的保护下，阿拉善牧场是荒漠中的绿洲。&nbsp;</p><p><br/></p><p>梭梭树被称作“沙漠植被之王”。成年梭梭能长到3-5米高，可以稳固5-10米的沙土。除了树苗第一年生长需要人工浇水，梭梭正常的生长期耐旱耐盐碱也耐强温差。但是，在荒漠化严重的情况下，梭梭的再生能力比较弱，自结种子往往不能成熟，需要人工种植。</p><p><br/></p><p><span style=\"font-size:14px;font-family:新宋体\"><img src=\"http://images.kaistart.com/14515723531.png\"/></span></p><p><span style=\"font-size:14px;font-family:新宋体\"></span></p><p><br/></p><p>然而，<span class=\"s1\">70年代末大生产时期，大面积的野生梭梭树被砍掉甚至连根拔起，用作燃料。作为牧区的天然屏障，阿拉善方圆800亩的原始梭梭林遭到了毁灭性破坏。草场失去了最后的遮挡，开始迅速沙化。</span>八九十年代，阿拉善的风沙开始越来越大。1993年5月5日的一场“黑风”（沙尘暴）卷走了264条生命，这成了阿拉善人心中永远的阴影。</p><p>草场再也住不了人。一万五千亩土地，曾经大几百户的阿拉善草场，现在只剩下五六户人家。<br/></p><p>我们找到老人的那天，沙暴又一次席卷了阿拉善盟。那日，老人一大早出门放羊，沙暴把她困在一颗三四米高的梭梭树下。<br/></p><p><br/></p><p class=\"p1\"><span class=\"s1\">我们问，“天这么冷，风这么大，您为什么还出来？”</span></p><p class=\"p1\">她说，“早上四五点钟，羊就饿了，羊从圈里跑出来，撞她的门。于是她就起了床，出来放羊。”&nbsp;</p><p class=\"p1\"><span class=\"s1\"></span></p><p class=\"p1\"><span class=\"s1\">然而，现在的草原早已成了荒漠，羊能吃的越来越少。但只有把羊养肥，才能卖个好价钱，来年才有钱买梭梭苗。</span></p><p class=\"p1\">原来，早在十年前，刘金香就跟老伴开始种梭梭树，因为梭梭可以防风固沙。但这片几十年间被榨干的土地想要恢复到从前的生机又是何等艰难。</p><p class=\"p1\">回忆起刚嫁到这片草原的时候，刘金香奶奶眼中还是会透出一丝光亮。<br/></p><p class=\"p1\"><span class=\"s1\">那时，茂密的原始梭梭林保护着草场。梭梭也是牧人们“取之不尽”的柴禾。每年冬天，方圆的农牧民都会赶着骆驼去几公里外的拉枯死的梭梭，每家都要屯上一两百棵过冬。但牧民们从来不动活梭梭。</span>因为牧民们都知道，梭梭林是草场的保护神。有梭梭在，沙暴就进不来。<br/></p><p class=\"p1\">因为舍不得丢下这片曾经带给他们生命的土地，刘金香和老伴决定留下来。&nbsp;</p><p>没有经济来源，老俩<span style=\"font-family: 宋体;\">花光自己的积蓄，亲戚家借了钱，</span>后来还跟政府申请了十万元贷款，用来种梭梭。刘奶奶还在长大的梭梭树下套种肉苁蓉，一种药材。老俩用养羊和卖药材赚的钱还政府贷款。</p><p><br/></p><p><img src=\"http://images.kaistart.com/14515723537.png\"/></p><h5 style=\"white-space: normal; text-align: center;\">梭梭树下套中的肉苁蓉。肉苁蓉是多年生肉质草本寄生植物，寄生在梭梭的根上，茎肉质为圆柱形，高40--140厘米。肉苁蓉是非常名贵的中药材，被誉为“沙漠人参”。（图片来源于网络）</h5><p><br/></p><p>2007年，老伴走了。方圆一百里只剩刘金香一个人。儿女不放心，想要把她接到城里去住。可她不想走。她说：“我走了，我的驴子、羊和梭梭树怎么办？”</p><p><br/></p><p>就这样，刘金香奶奶一个人留在了阿拉善种梭梭。</p><p><br/></p><p>在阿拉善的三天采访中，我们总是不禁感叹这位平凡老人的伟大。然而，老人却不以为然。</p><p><span style=\"font-family: 宋体;\">“种了三千亩梭梭，我没觉得这有多么了不起。守护自己的家园，每个人都会这样做。”</span><br/><span style=\"font-family: 宋体;\"></span></p><p><br/></p><p>她常说，阿拉善给了她一个家，这里就是她一辈子的家。<br/></p><p>&nbsp;</p><h2>我的项目：</h2><h3>陪种梭老人一起守护荒漠家园</h3><p><strong><span style=\"font-size:14px;font-family:新宋体\"><img src=\"http://images.kaistart.com/14515723566.png\"/></span></strong></p><p><span style=\"font-size:14px;font-family:新宋体\"></span></p><p><br/></p><p>八年，一个人，面对一万五千亩荒漠，种下了三千亩十五万棵梭梭树。66岁的刘金香奶奶以常人难以理解的执着，守护着阿拉善的绿色。</p><p><br/></p><p>然而，老人年纪大了，体力也大不如前。2012年圈羊的时候，刘奶奶被羊群冲倒，摔断了腿。现在，老人腿脚活动不便，种梭梭常常要走两三个小时也成了件难事。</p><p><br/></p><p>于是，每年种梭梭的时候，刘金香就叫三个孩子回来帮忙，种好之后她浇水。刘金香每天打好水拉上水车，走两个小时去给梭梭浇水。每天浇一百桶水，三千亩梭梭浇一个月才能浇完。</p><p><br/></p><p>她说，梭梭好活但梭梭也要按照节气栽种。春分、清明、谷雨这三个节气栽上才肯活。坑挖的小了，吃水少，它不肯活。坑挖的大了，浪费水，其他的梭梭就没水喝了。</p><p><img src=\"http://images.kaistart.com/145157235610.png\"/></p><h5 style=\"text-align: center;\">荒漠里的梭梭林</h5><p><span style=\"font-size: 14px; font-family: 新宋体;\"></span></p><p><img src=\"http://images.kaistart.com/14515723571.png\"/></p><h5 style=\"text-align: center;\">荒漠中成年的梭梭树，树冠能长到2-3米高，有的甚至可以长到5米，树根根系发达，垂直根深可达5米以下，水平根也极发达。一棵梭梭树可以固沙20立方米，是戈壁沙滩最优良的防沙固沙树种之一，被称为“沙漠植被之王”。（图片来源于网络）</h5><p><br/></p><p>2015年春天，为再种植950亩的梭梭，刘金香拿出自己攒的6万买了梭梭苗，忙了半个月 才把梭梭都种好。然而，4月15日的一场沙暴把所有树苗都埋了。3、40厘米高的树坑被填平，幼苗勉强露出几根细枝。<br/></p><p><span style=\"font-size: 14px; font-family: 新宋体;\"></span><img src=\"http://images.kaistart.com/14515723580.png\"/></p><h5 style=\"text-align: center;\">刘奶奶将被埋的梭梭救起</h5><p><span style=\"font-size:14px;font-family:新宋体\"></span></p><p><br/></p><p>现在的阿拉善，种梭梭更加困难。最大的问题是缺水。最初刘金香跟老伴儿一起打的水井，水也越来越少，只够她自己吃喝用。地下水位低，梭梭幼苗栽下前两年还需要几次人工浇水。而水要用车从附近有水的村子拉进来。一车水五吨30块。3000亩梭梭浇一次需要400车水。刚种的时候浇一次，一个月后再浇一次。老伴走后，刘金香一个人干两个人的活，套种肉苁蓉还政府贷款也愈发困难的刘奶奶，凑够浇灌三千亩梭梭的四千吨水费更是难上加难。</p><p><br/></p><p>现如今，孩子们都在县城生活。只有她孤身一人在废弃的草场荒漠，照顾羊和梭梭。但她还是希望孩子们能回到这片草场。她想，只要在1.5万亩荒废的草场上种植梭梭、恢复生态，孩子们也许就会回到这片土地。然而，实现这个“精卫填海”般的目标，至少需要5年。</p><p><br/></p><p>我们想要让更多人知道这个种梭梭的刘金香奶奶，让大家一起参与进来，帮助刘奶奶种梭梭。</p><p><br/></p><p>&nbsp;&nbsp;</p><h2 style=\"white-space: normal;\">为什么众筹？</h2><p style=\"white-space: normal;\">&nbsp;</p><p style=\"white-space: normal;\">这一年，与刘金香奶奶的结识，让我开始反思做公益媒体的意义。2013年旅游卫视《善·行天下》开播以来，我和栏目同事前后参与了135期公益影像，播放时间累计超过2025分钟。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">这里有135个小人物的故事。寻找、采访、拍摄、后期，到播放、重播、展映。作为媒体人，我们发现社会问题，并通过影像记录它。但形成影像并播放成了我们工作的终点。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">现在，我和栏目组想要通过众筹，把这个终点变成起点。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">这不仅是刘奶奶的事，是每一个中国人的事。我们希望让更多人了解刘奶奶种梭梭的事情，并参与到种梭梭中来，一起为我们的蓝天和新鲜空气行动。</p><h2><br/></h2><h2>我的回报：</h2><p><strong><span style=\"font-size:14px;font-family:新宋体\"></span></strong><br/></p><p><strong><span style=\"font-size:14px;font-family:新宋体\"><img src=\"http://images.kaistart.com/14515723597.png\"/></span></strong></p><p><strong><span style=\"font-size:14px;font-family:宋体\"></span></strong></p><p><strong><br/></strong></p><p><strong>1.为你种一颗梭梭</strong>&nbsp;&nbsp;</p><p>刘奶奶会在明年谷雨时节，为你在阿拉善种一颗梭梭，上面会挂上你的姓名卡。我们会为你的梭梭树和姓名卡拍照，并通过微信发给你。</p><p><br/></p><p><strong>2.写给你的感谢信</strong></p><p>我会写一封感谢信寄给你，并且邀请你进入我的“梭梭林微信群组”。在这里，我们会为大家提供阿拉善梭梭林的最新动态。</p><p>&nbsp;</p><p><strong>3.跟我一起去阿拉善种梭梭</strong>&nbsp;</p><p>明年谷雨时节，我们会邀请你一起，与我和旅游卫视《善行天下》剧组一起，同行阿拉善，亲自探访刘奶奶，尝试荒漠种植梭梭树。</p><p>&nbsp;<br/></p><p>作为向导，我和栏目剧组团队会安排整个行程。行程中，我们会全程拍摄这次 “与《善行天下》同行，探访阿拉善” 的活动。之后，我们会专门制作一个纪录片。</p><p>&nbsp;</p><p><strong>你还会得到：</strong></p><p>这部纪录片的独家光盘一张</p><p>亲手装上一瓶阿拉善的沙子留作纪念</p><p>刘奶奶为远道而来的你准备的阿拉善简餐</p><p><span style=\"font-size:14px;font-family:宋体\"></span><br/></p><p style=\"white-space: normal;\">由于此次众筹款项会全部交给刘金香奶奶做梭梭种植和养护的费用，因此，此次阿拉善之行差旅费需自理。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><img src=\"http://images.kaistart.com/14515723608.png\"/></p><p style=\"white-space: normal;\">你愿意和刘奶奶一起，来守护中国的绿色，头顶的蓝天么？</p><p><br/></p>\"";
    
    NSAttributedString *attributedString
    = [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding]
                                       options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                 NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                            documentAttributes:nil
                                         error:nil];

    self.textView.attributedText = attributedString;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
