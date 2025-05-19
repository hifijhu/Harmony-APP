import { router } from '@kit.ArkUI'

class Eval{
  tid: number;
  sid: number;
  name: string;
  img: Resource;
  level: number;
  time: string;
  evaluation: string;

  constructor(tid:number,sid:number,name:string,img:Resource,level:number, time:string,evaluation:string) {
    this.tid = tid
    this.sid = sid
    this.name = name
    this.img = img
    this.level = level
    this.time = time
    this. evaluation = evaluation
  }
}
class Tiezi{
  tid: number;
  lz: string;
  lzImg: Resource;
  lzLevel: number;
  time: string;
  star: number;
  title: string;
  short: string;
  up: number;
  down: number;
  evalu: Eval[];

  constructor(tid: number, lz: string, lzImg: Resource, lzLevel: number, time: string, star: number, title: string,
  short: string, up: number, down: number, evalu: Eval[]) {
    this.tid = tid
    this.lz = lz
    this.lzImg = lzImg
    this.lzLevel = lzLevel
    this.time = time
    this.star = star
    this.title = title
    this.short = short
    this.up = up
    this.down = down
    this.evalu = evalu
  }
}
@Entry
@Component
struct Sub {
  @State tips : string = ''
  @State starIcon : string = 'app.media.star1'
  @State zanUrl : string = 'app.media.dianzan2'
  @State caiUrl : string = 'app.media.diancai'
  //@State params : object = router.getParams()
  //@State tid : number = this.params["id"]
  private evalList : Eval[] = [
    new Eval(1,1,'xxx',$r('app.media.huo'),2,'2小时','Im fine.'),
    new Eval(1,2,'aaa',$r('app.media.Avatar'),4,'1小时','Im stupid.'),
    new Eval(1,3,'bbb',$r('app.media.yejian'),5,'1小时','You are stupid.'),
    new Eval(1,4,'ccc',$r('app.media.yanjing'),3,'1小时','We are stupid.'),
    new Eval(1,5,'ddd',$r('app.media.tuichudenglu'),8,'30分钟','Who is stupid?'),
    new Eval(1,6,'eee',$r('app.media.search'),10,'10分钟','Me.'),
  ]

  @State private data : Tiezi = new Tiezi(1, 'abc', $r('app.media.Avatar'),3,'2小时',11, 'Hello World', 'nihao shijie',99,10,this.evalList)
  @State zan : number = 0
  @State cai : number = 0
  private swiperController : SwiperController = new SwiperController()
  private scrollController : Scroller = new Scroller()
  build() {
    Scroll(this.scrollController){
      Column({space:20}){
        Row({space:100}){
          Image($r("app.media.left")).width(30).height(30).onClick(() => {
            router.back()
          })
          Text("帖子详情").fontSize(22)
          Button().type(ButtonType.Normal).backgroundColor(Color.Transparent).backgroundImage($r('app.media.liebiao')).backgroundImageSize(ImageSize.Contain).width(30).height(30)
            .onClick(() => {

            })
            .bindMenu([{
              value: '截取内容详情',
              action: () => {

              }
            }, {
              value: '复制帖子链接',
              action: () => {

              }
            }, {
              value: '浏览器打开',
              action: () => {

              }
            }, {
              value: '举报',
              action: () => {

              }
            }])
        }.margin(20).width("100%").justifyContent(FlexAlign.Center)
        Row({space:5}){
          Image(this.data.lzImg).width(30).height(30)
          Column({space:5}){
            Row({space:3}){
              Text(this.data.lz).fontSize(16)
              Text("Lv."+this.data.lzLevel).fontSize(12).fontColor(Color.White).backgroundColor("#ff88bfb7").borderRadius(1)
            }.width("100%")
            Text(this.data.time+'前').fontSize(12).width("100%").fontWeight(FontWeight.Lighter)
          }.width("100")
          Image($r(this.starIcon)).width(25).height(25).margin({left:110})
            .onClick(() => {
              if(this.starIcon === 'app.media.star1'){
                this.starIcon = 'app.media.star2'
                this.data.star = this.data.star + 1
              }
              else {
                this.starIcon = 'app.media.star1'
                this.data.star = this.data.star - 1
              }
            })

          Text(this.data.star+'收藏').fontSize(13)
        }.width("100%").margin({left:40})
        Text(this.data.title).fontSize(22).fontWeight(FontWeight.Medium).width("100%").margin({left:40})
        Text(this.data.short).fontSize(15).width("100%").margin({left:40})
        Row({space:15}){
          Button(){
            Column(){
              Image($r(this.caiUrl))
                .width(25).height(25)
              Text(this.data.down+'人').fontSize(11)
            }
          }.type(ButtonType.Normal).backgroundColor(Color.Transparent)
          .onClick(() => {
            if(this.cai===0){
              this.cai = 1
              this.data.down += 1
              this.caiUrl = 'app.media.cai'
              if (this.zan===1) {
                this.zan = 0
                this.data.up -= 1
                this.zanUrl = 'app.media.dianzan2'
              }
            }
            else {
              this.cai = 0
              this.data.down -= 1
              this.caiUrl = 'app.media.diancai'
            }
          })
          Progress({value:this.data.down,total:this.data.down+this.data.up,type:ProgressType.Linear})
            .style({enableSmoothEffect: true, strokeWidth:10})
            .backgroundColor(Color.Red).width("70%")
          Button(){
            Column(){
              Image($r(this.zanUrl))
                .width(25).height(25)
              Text(this.data.up+'人').fontSize(11)
            }
          }.type(ButtonType.Normal).backgroundColor(Color.Transparent)
          .onClick(() => {
            if(this.zan===0){
              this.zan = 1
              this.data.up += 1
              this.zanUrl = 'app.media.zan'

              if (this.cai===1) {
                this.cai = 0
                this.data.down -= 1
                this.caiUrl = 'app.media.diancai'
              }
            }
            else {
              this.zan = 0
              this.data.up -= 1
              this.zanUrl = 'app.media.dianzan2'
            }
          })
        }
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column(){
              List({space:20}){


                ForEach(this.evalList,(value:Eval, index:number)=>{
                  ListItem(){
                    Column({space:20}){
                      Row({space:5}){
                        Image(value.img).width(30).height(30)
                        Column({space:5}){
                          Row({space:3}){
                            Text(value.name).fontSize(16)
                            Text("Lv."+value.level).fontSize(12).fontColor(Color.White).backgroundColor("#ff88bfb7").borderRadius(1)
                          }.width("100%")
                          Text(value.time+'前').fontSize(12).width("100%").fontWeight(FontWeight.Lighter)
                        }.width("100")



                      }.width("100%").margin({left:40})

                      Text(value.evaluation).fontSize(18).width("90%")

                      Row({space:5}){
                        Text().backgroundImage($r('app.media.dianzan')).width(15).height(15).backgroundImageSize(ImageSize.Contain)


                        Text().backgroundImage($r('app.media.pinglun')).width(15).height(15).backgroundImageSize(ImageSize.Contain)


                        Text().backgroundImage($r('app.media.yanjing')).width(15).height(15).backgroundImageSize(ImageSize.Contain)

                      }.width("100%").margin({left:550})
                    }.width("100%").padding({top:8, bottom:8})
                  }.margin({left:3.5})

                })
              }.width("100%")
              .edgeEffect(EdgeEffect.Spring)
              .nestedScroll({
                scrollForward: NestedScrollMode.PARENT_FIRST,
                scrollBackward: NestedScrollMode.SELF_FIRST
              })


            }




          }.tabBar("评论")

          TabContent() {
          }.tabBar("点评")
        }
        .vertical(false)
        .height("100%")

      }
    }
    .width("100%").height("100%").edgeEffect(EdgeEffect.Spring)
    .friction(0.6)

    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')

  }

  onPageShow(): void {

  }
}