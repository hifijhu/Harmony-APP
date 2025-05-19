import { router } from '@kit.ArkUI';

class wodeButton{
  name: string;
  icon: Resource;

  constructor(name: string, icon: Resource) {
    this.name = name
    this.icon = icon
  }
}
@Entry
@Component
export struct Wode {
  private myButtons1 : wodeButton[] = [
    new wodeButton('我的收藏', $r('app.media.shoucang')),
    new wodeButton('我的发表', $r('app.media.fabiao')),
    new wodeButton('我的回复', $r('app.media.huifu')),
    new wodeButton('我的草稿', $r('app.media.caogao')),
    new wodeButton('浏览历史', $r('app.media.liulanlishi')),
    new wodeButton('黑名单', $r('app.media.heimindan')),
  ]

  private myButtons2 : wodeButton[] = [
    new wodeButton('应用设置',$r('app.media.shezhi')),
    new wodeButton('夜间模式',$r('app.media.yejian')),
    new wodeButton('账号管理',$r('app.media.zhanghao')),
    new wodeButton('退出登录',$r('app.media.tuichudenglu'))
  ]


  build() {
    Column({space:15}){
      Text("我的").fontSize(25).backgroundColor(Color.White).width("100%").textAlign(TextAlign.Center).height("10%")
      Row(){
        Image($r('app.media.Avatar')).width(40).height(40)
        Column(){
          Text("Name").fontSize(18).width("80%")
          Row({space:90}){
            Text("Lv.x").fontColor(Color.Blue)
            Text("1111/9999").fontSize(14)
          }.width("80%")
          Progress({value:1111,total:9999, type:ProgressType.Linear}).width("80%")
        }.justifyContent(FlexAlign.Start).width("80%")
        Image($r('app.media.icon_arrow_right')).width(20).height(20)
      }.padding(15).width("90%").backgroundColor(Color.White).borderRadius(10)
      .onClick(() => {
        router.pushUrl({
          url: 'pages/zhuye'
        })
      })
      Column({space:21}){
        ForEach(this.myButtons1, (value:wodeButton, index: number) => {
          Button(){
            Row({space:10}){
              Image(value.icon).width(25).height(25)
              Text(value.name).fontSize(16)
            }.width("100%")
          }.type(ButtonType.Normal).backgroundColor(Color.Transparent).width("80%").height(25).margin({right:35})
        })
      }.width("90%").backgroundColor(Color.White).borderRadius(10).padding({top:20 ,bottom:20})
      Column({space:21}){
        ForEach(this.myButtons2, (value:wodeButton, index: number) => {
          Button(){
            Row({space:10}){
              Image(value.icon).width(25).height(25)
              Text(value.name).fontSize(16)
            }.width("100%")
          }.type(ButtonType.Normal).backgroundColor(Color.Transparent).width("80%").height(25).margin({right:35})
        })
      }.width("90%").backgroundColor(Color.White).borderRadius(10).padding({top:20 ,bottom:20})

    }.width("100%").height("100%").backgroundColor("#f5f6fa")
  }
}