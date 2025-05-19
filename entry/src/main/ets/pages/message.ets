@Entry
@Component
export struct Message {

  private tabController : TabsController = new TabsController()
  @State currentIndex : number = 0
  @Builder TabBuilder(title: string, targetIndex: number){
    Column(){
      Text(title).fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }.width('100%').height(50).justifyContent(FlexAlign.Center)
  }
  build() {
    Column(){
      Text("Message").fontSize(25).fontWeight(FontWeight.Bold).margin({top:20})
      Tabs({barPosition: BarPosition.Start, controller: this.tabController}){
        TabContent(){
          List(){
            ListItem(){
              Button(){
                Row(){
                  Image($r("app.media.Avatar")).width(30).height(30)
                  Column(){
                    Text("Friend").fontSize(22).fontWeight(FontWeight.Bold).width("80%")
                    Text("How are you?").fontSize(15).width("80%")
                  }.width(150).justifyContent(FlexAlign.Start).margin({right:70})
                  Text("07/17 09:00").fontSize(13)
                }

              }.type(ButtonType.Normal).backgroundColor(Color.Transparent)
            }.margin({left:5})
          }.width("95%").backgroundColor(Color.White).height("100%")
        }.tabBar(this.TabBuilder('私信', 0))

        TabContent(){
          Column(){
            Column(){
              Row({space:10}){
                Image($r('app.media.Avatar')).width(30).height(30)
                Column({space:2}){
                  Text("NowLand").fontSize(15).width("100%")
                  Text("07/17 12:30").fontSize(15).width("100%")
                }.width("50%")
                Image($r('app.media.zhuanfa')).width(25).height(25).margin({left:60})
              }.padding(10).width("95%")
              Text("There is someone that is coming or passing away in your life around the clock, soyou may lose sight " +
                "of those seen, and forget those remembered. There is gain and lossin your life, so you may catch sight of those unseen, and remember those forgotten.Nevertheless, doesn't the unseen exist for sure? Will the remembered remain forever?").width("90%")
                .fontSize(13)
            }.shadow({
              radius: 4,
              color: `rgba(0,0,0,0.3)`,
              offsetY:10
            }).borderRadius(5).padding(10)

          }.width("95%").height("100%")
        }.tabBar(this.TabBuilder('回复', 1))

        TabContent(){
          Text('什么都没有哦~').fontSize(25)
        }.tabBar(this.TabBuilder('提到', 2))

        TabContent(){
          Text('什么都没有哦~').fontSize(25)
        }.tabBar(this.TabBuilder('点评', 3))

      }
      .scrollable(true)
      .barWidth("100%")
      .barHeight(60)
      .onChange((index) => {
        this.currentIndex = index
      })
    }
  }
}