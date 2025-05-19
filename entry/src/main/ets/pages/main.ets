import { Bankuai } from './bankuai';
import { Home } from './home';
import { Message } from './message';
import { Wode } from './wode';

@Entry
@Component
struct Main {
  @State message: string = 'Hello World';
  private tabController : TabsController = new TabsController()
  @State currentIndex : number = 0
  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource){
    Column({space:3}){
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg).size({width:25, height:25})
      Text(title).fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }.width('100%').height(50).justifyContent(FlexAlign.Center)
  }

  build() {
    Tabs({barPosition: BarPosition.End, controller: this.tabController}){
      TabContent(){
        Home()
      }.tabBar(this.TabBuilder('首页', 0, $r('app.media.shouye2'), $r('app.media.shouye')))

      TabContent(){
        Bankuai()
      }.tabBar(this.TabBuilder('板块', 1, $r('app.media.bankuai2'), $r('app.media.bankuai')))

      TabContent(){
        Message()
      }.tabBar(this.TabBuilder('消息', 2, $r('app.media.xiaoxi2'), $r('app.media.xiaoxi')))

      TabContent(){
        Wode()
      }.tabBar(this.TabBuilder('我的', 3, $r('app.media.wode2'), $r('app.media.wode')))
    }
    .scrollable(false)
    .barWidth("100%")
    .barHeight(60)
    .onChange((index) => {
      this.currentIndex = index
    })
  }
}