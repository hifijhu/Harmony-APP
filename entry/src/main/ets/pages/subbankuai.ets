import { Adialog } from './home'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct SubBan {
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
        Image($r('app.media.back')).width(100).height(100).borderRadius(50).margin({top:70}).borderColor(Color.White).borderWidth(3)
        Text("水手之家").fontSize(22).fontColor(Color.White).fontWeight(FontWeight.Medium)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column(){
              List({space:20}){


                ForEach(this.myDialog,(value:Adialog, index:number)=>{
                  ListItem(){
                    Column({space:14}){
                      Row(){
                        Image(value.lzImg).width(25).height(25).margin({left:1})
                        Column(){
                          Text(value.lz).fontSize(13).width("100%")
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
                    }.width("99%").padding({top:13, bottom:13})
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
          }.tabBar("水手").borderRadius(10)
          TabContent() {
          }.tabBar("之家")
        }
        .vertical(false)
        .height("100%")
      }.backgroundBlurStyle(BlurStyle.Thin).backgroundImageSize(ImageSize.Contain)
      .backgroundImage($r('app.media.back'))
      .width("100%")
    }
    .width("100%").height("100%").edgeEffect(EdgeEffect.Spring)
    .friction(0.6)

    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')
  }
}