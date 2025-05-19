import { router } from '@kit.ArkUI';
import getHttpData from './request';

/*
* Adialog:首页的帖子类
* id：帖子的id
* lz：贴主的名称，是“楼主”的缩写
* lzImg：楼主的头像
* title：帖子标题
* short：帖子简介
* up：点赞数
* evla：评论数
* view：观看数
* cate：分区
* lastTime：最后一次回复在几分钟前
 */
export class Adialog{
  id: number;
  lz: string;
  lzImg: Resource;
  title: string;
  short: string;
  up: number;
  evla: number;
  view: number;
  cate: string;
  lastTime: number;

  constructor(id: number, lz:string, lzImg: Resource, title: string, short: string, up: number,
  evla: number, view: number, cate: string, lastTime: number) {
    this.id = id
    this.lz = lz;
    this.lzImg = lzImg
    this.title = title
    this.short = short
    this.up = up
    this.evla = evla
    this.view = view
    this.cate = cate
    this.lastTime = lastTime
  }
}


@Entry
@Component
export struct Home {
  @State message: string = 'Hello World';
  private currentOffsetY: number = 0;
  private timer: number = 0;
  @State refreshStatus: boolean = false;
  @State upRefreshStatus: boolean = false

  @Builder UpDownRefreshBuilder(text: string, state: string) {
    Row() {
      Image($r('app.media.refresh'))
        .width(32)
        .height(32)
      Text(text).fontSize(16)
    }
    .justifyContent(FlexAlign.Center)
    .position({
      y: state === 'down' ? 20 : -20
    })
    .zIndex(999)
    .width('94%')
    .height('8%')
  }

  @Styles
  listCard() {
    .backgroundColor(Color.White)

    .width("98%")
    .borderRadius(8)

  }
  private scroller = new Scroller()
  private controller : SearchController = new SearchController()
  private swipercontroller : SwiperController = new SwiperController()
  @State changeValue : string = ''
  @State submitValue : string = ''
  @State resourceName : string = ''
  @State iconMap : Map<string, string> = new Map()
  @State url : string[] = []
  arr : number[] = [0,1,2,3,4,5,6,7,8,0,1,2,0,1,2]

  ImgUrl : string[] = ['app.media.search', 'app.media.startIcon', 'app.media.background', 'app.media.foreground']
  iconUrl: string[] = ['huo', 'shiwuzhaol', 'jiaotongzhinan', 'bumen', 'renwu', 'xunzhang', 'daoju', 'tousu', 'jifen', 'daohang', 'heimindan']
  icondec: string[] = ['每日答题','失物招领','交通指南','直通车','任务','勋章中心','道具商店','后勤投诉','积分记录','新手导航','小黑屋']
  icon: string[][] = [['app.media.huo','每日答题'],['app.media.shiwuzhaol','失物招领'],['app.media.jiaotongzhinan','交通指南'],
  ['app.media.bumen','直通车'],['app.media.renwu','任务'],['app.media.xunzhang','勋章中心'],['app.media.daoju','道具商店'],['app.media.tousu','后勤投诉'],['app.media.jifen','积分记录'],['app.media.daohang','新手导航'],['app.media.heimindan','小黑屋']]
  myDialog: Adialog[] = [
    new Adialog(1,'lz',$r('app.media.search'),'Hello World','你好世界',99,10,999,"哈哈哈哈",10),
    new Adialog(1,'lz',$r('app.media.search'),'Hello World','你好世界',99,10,999,"哈哈哈哈",10),
    new Adialog(1,'lz',$r('app.media.search'),'Hello World','你好世界',99,10,999,"哈哈哈哈",10),
    new Adialog(1,'lz',$r('app.media.search'),'Hello World','你好世界',99,10,999,"哈哈哈哈",10),
    new Adialog(1,'lz',$r('app.media.search'),'Hello World','你好世界',99,10,999,"哈哈哈哈",10),
    new Adialog(1,'lz',$r('app.media.search'),'Hello World','你好世界',99,10,999,"哈哈哈哈",10),
    new Adialog(1,'lz',$r('app.media.search'),'Hello World','你好世界',99,10,999,"哈哈哈哈",10),
  ]

  build() {
    Scroll(this.scroller){

      if(this.refreshStatus) {
        this.UpDownRefreshBuilder('正在刷新', 'down')
      }
      Column(){
        Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
          .searchButton('SEARCH')
          .width(350)
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .onSubmit((value: string) => {
            this.submitValue = value
          })
          .onChange((value: string) => {
            this.changeValue = value
          })
          .margin({ left:20, right:20, top:20 })





        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column(){
              List({space:20}){
                ListItem(){
                  Swiper(this.swipercontroller){
                    ForEach(this.url,(item : string, index : number) => {

                      Image("https://cn.bing.com"+item)
                        .width("250")
                        .height("150")
                    })
                  }.onAppear(async ()=>{
                    this.url = await getHttpData()
                  })
                  .indicator(true)
                  .loop(true)
                  .autoPlay(true)
                  .indicator(
                    new DotIndicator()
                      .itemWidth(8)
                      .itemHeight(8)
                      .selectedItemWidth(8)
                      .selectedItemHeight(8)
                      .color('#f5f6fa')
                      .selectedColor("#ffd1fcf7")
                  )
                  .width("95%")
                  .borderRadius(10)
                  .margin({left:9})
                }
                ListItem(){

                  Grid(){
                    ForEach(this.icon, (value:string[], index:number) => {
                      GridItem(){
                        Button(){
                          Column({space:8}){
                            Image($r(value[0])).width(30).height(30)
                            Text(value[1]).fontSize(14).fontWeight(FontWeight.Medium)
                          }
                        }.type(ButtonType.Normal).backgroundColor(Color.Transparent).width("100%").height("100%")
                      }.width(65).height(50)

                    })
                  }
                  .rowsTemplate('1fr 1fr')
                  .padding({left:10, right:10})
                  .backgroundColor(Color.White)
                  .width("100%")
                  .height("200")
                  .rowsGap(15)
                  .columnsGap(28)
                }
                ForEach(this.myDialog,(value:Adialog, index:number)=>{
                  ListItem(){
                    Column({space:15}){
                      Row(){
                        Image(value.lzImg).width(25).height(25).margin({left:1})
                        Column(){
                          Text(value.lz).fontSize(15).width("100%")
                          Text(value.lastTime+"分钟前有回复").fontSize(8).width("100%")
                        }.justifyContent(FlexAlign.Start).width("25%")

                        Text(value.cate).margin({left:150}).fontSize(13)
                      }.justifyContent(FlexAlign.Start)

                      Text(value.title).fontSize(20).fontWeight(FontWeight.Bold).width("90%")
                      Text(value.short).fontSize(12).fontWeight(FontWeight.Lighter).width("90%")
                      Row({space:5}){
                        Text().backgroundImage($r('app.media.dianzan')).width(20).height(20).backgroundImageSize(ImageSize.Contain)
                        Text(value.up.toString()).margin({right:80}).fontSize(14)

                        Text().backgroundImage($r('app.media.pinglun')).width(20).height(20).backgroundImageSize(ImageSize.Contain)
                        Text(value.evla.toString()).margin({right:80}).fontSize(14)

                        Text().backgroundImage($r('app.media.yanjing')).width(20).height(20).backgroundImageSize(ImageSize.Contain)
                        Text(value.view.toString()).fontSize(14)
                      }.width("100%").margin({left:40})
                    }.width("99%").padding({top:14, bottom:14})
                  }.listCard().margin({left:3.5})
                  .onClick(() => {
                    router.pushUrl({
                      url: 'pages/sub',
                      params: {
                        id: value.id
                      }
                    })
                  })
                })
              }.width("100%")
                .edgeEffect(EdgeEffect.Spring)
                .nestedScroll({
                  scrollForward: NestedScrollMode.PARENT_FIRST,
                  scrollBackward: NestedScrollMode.SELF_FIRST
                })


            }




          }.tabBar("最新发表")

          TabContent() {
            List({space:15}){
              ForEach(this.myDialog,(value:Adialog, index:number)=>{
                ListItem(){
                  Column({space:15}){
                    Row(){
                      Image(value.lzImg).width(25).height(25).margin({left:1})
                      Column(){
                        Text(value.lz).fontSize(15).width("100%")
                        Text(value.lastTime+"分钟前有回复").fontSize(8).width("100%")
                      }.justifyContent(FlexAlign.Start).width("25%")

                      Text(value.cate).margin({left:150}).fontSize(13)
                    }.justifyContent(FlexAlign.Start)

                    Text(value.title).fontSize(20).fontWeight(FontWeight.Bold).width("90%")
                    Text(value.short).fontSize(12).fontWeight(FontWeight.Lighter).width("90%")
                    Row({space:5}){
                      Text().backgroundImage($r('app.media.dianzan')).width(20).height(20).backgroundImageSize(ImageSize.Contain)
                      Text(value.up.toString()).margin({right:80}).fontSize(14)

                      Text().backgroundImage($r('app.media.pinglun')).width(20).height(20).backgroundImageSize(ImageSize.Contain)
                      Text(value.evla.toString()).margin({right:80}).fontSize(14)

                      Text().backgroundImage($r('app.media.yanjing')).width(20).height(20).backgroundImageSize(ImageSize.Contain)
                      Text(value.view.toString()).fontSize(14)
                    }.width("100%").margin({left:40})
                  }.width("99%").padding({top:14, bottom:14})
                }.listCard().margin({left:3.5})
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/sub',
                    params: {
                      id: value.id
                    }
                  })
                })
              })
            }
            .width("100%")
            .edgeEffect(EdgeEffect.Spring)
            .nestedScroll({
              scrollForward: NestedScrollMode.PARENT_FIRST,
              scrollBackward: NestedScrollMode.SELF_FIRST
            })

          }.tabBar("最新回复")

          TabContent() {
            Text('什么都没有哦~').fontSize(25)
          }.tabBar("热门")
          TabContent() {
            Text('什么都没有哦~').fontSize(25)
          }.tabBar("精华")

        }
        .vertical(false)
        .height("100%").animationDuration(0)

      }.width("100%")
      if(this.upRefreshStatus) {

          this.UpDownRefreshBuilder('正在加载', 'up')

      }

    }.width("100%").height("100%").edgeEffect(EdgeEffect.Spring)
    .friction(0.6)
    .backgroundColor('#f5f6fa')
    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')




  }


  async onPageShow(): Promise<void> {
    for (let i=0; i<this.iconUrl.length; i=i+1){
      this.iconMap.set('app.media'+this.iconUrl[i], this.icondec[i])
      
    }
    this.url = await getHttpData()

  }
  putDownRefresh(event?: TouchEvent): void {
    if (event === undefined) {
      return;
    }
    switch (event.type) {
      case TouchType.Down:
        this.currentOffsetY = event.touches[0].y;
        break;
      case TouchType.Move:
        if (this.scroller.currentOffset().yOffset < 50) {
          this.refreshStatus = event.touches[0].y - this.currentOffsetY > 50;
        }
        this.upRefreshStatus = event.touches[0].y - this.currentOffsetY < -50;
        break;
      case TouchType.Cancel:
        break;
      case TouchType.Up:
      // Only simulation effect, no data request
        this.timer = setTimeout(() => {
          if (this.upRefreshStatus) {
            this.scroller.scrollTo({
              // 调用scrollTo滚动到具体位置
              xOffset: 0, // 竖直方向滚动，该值不起作用
              yOffset: 680, // 滚动到底部
              animation: {
                // 滚动动画
                duration: 1500,
                curve: Curve.EaseOut
              }
            })
          }
          this.refreshStatus = false;
          this.upRefreshStatus = false;
        }, 1500);
        break;
    }

  }
}