import { router } from '@kit.ArkUI'
import { Adialog } from './home'

@Entry
@Component
struct Zhuye {
  @State tips : string = ''
  @State starIcon : string = 'app.media.star1'
  //@State params : object = router.getParams()
  //@State tid : number = this.params["id"]

  @State zan : number = 0
  @State cai : number = 0
  @Styles
  listCard() {
    .backgroundColor(Color.White)

    .width("98%")
    .borderRadius(8)

  }
  private swiperController : SwiperController = new SwiperController()
  private scrollController : Scroller = new Scroller()
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
    Scroll(this.scrollController){
      Column({space:20}){

          Row({space:100}){
            Image($r("app.media.left")).width(30).height(30).onClick(() => {
              router.back()
            })
            Text("Name").fontSize(22)
            Button().type(ButtonType.Normal).backgroundColor(Color.Transparent).backgroundImage($r('app.media.liebiao')).backgroundImageSize(ImageSize.Contain).width(30).height(30)
              .onClick(() => {

              })
              .bindMenu([{
                value: '修改资料',
                action: () => {

                }
              }, {
                value: '举报',
                action: () => {

                }
              }])
          }.margin(20).width("100%").justifyContent(FlexAlign.Center)
          Stack({alignContent: Alignment.Top}){
            Column(){
              Column().height("50")
              Column({space:20}){
                Row({space:5}){
                  Text("Name")
                  Text("Lv.5").fontColor(Color.White).backgroundColor("#ff4711c6").borderRadius(3)
                }.margin({top:50})
                Text("粉丝：0 关注：0 好友：0 访客：0")
                Text("Ta还没有设置签名")
              }.backgroundColor(Color.White).borderRadius(10).padding(20).width("95%")
            }

            Image($r('app.media.666')).width(100).height(100).borderRadius(50)
          }
          Row({space:5}){}.width("100%").margin({left:40})


          Tabs({ barPosition: BarPosition.Start }) {
            TabContent(){
              Column(){
                Column({space:12}){
                  Text("基本信息").fontColor("#ff5aa2a5").fontSize(20).width("100%").margin({bottom:10})
                  Row(){
                    Text("在线状态：")
                    Text("在线").fontColor("#f50acee7")
                  }.width("100%")
                  Text("在线时间：996小时").width("100%")
                  Text("上次访问：0分钟前").width("100%")
                  Text("年龄：365天").width("100%")
                  Divider().strokeWidth(1).color("#f5f6fa")
                  Button("查看更多>").type(ButtonType.Normal).backgroundColor(Color.Transparent).fontColor(Color.Black)
                }.width("95%").shadow({
                  radius: 4,
                  color: `rgba(0,0,0,0.3)`,
                  offsetY:10
                })
                .backgroundColor(Color.White)
                .borderRadius(5)
                .padding({ left: 20, top: 20 })
              }.height("100%")

            }.tabBar("主页")
            TabContent() {
              Column(){
                List({space:20}){


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
                .backgroundColor("#f5f6fa")


              }




            }.tabBar("发表")

            TabContent() {
              Text('什么都没有哦~').fontSize(25)
            }.tabBar("回复")

            TabContent() {
              Text('什么都没有哦~').fontSize(25)
            }.tabBar("收藏")
          }
          .vertical(false)
          .height("100%").animationDuration(0)
        }.width("100%")

      .backgroundImage($r('app.media.666')).backgroundImageSize(ImageSize.Contain)
      .backgroundBlurStyle(BlurStyle.Thin)
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