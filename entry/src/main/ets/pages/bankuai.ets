import { router } from '@kit.ArkUI';

class Tab{
  id: number;
  name: string;
  content: Category[]

  constructor(id: number, name:string, content: Category[]) {
    this.id = id
    this.name = name
    this.content = content
  }
}

class Category{
  img: Resource;
  name: string;

  constructor(img: Resource, name: string) {
    this.img = img
    this.name = name
  }
}
@Entry
@Component
export struct Bankuai {
  @State message: string = 'Hello World';
  @State currentIndex: number = NaN;
  private tabController : TabsController = new TabsController()
  myCategories : Category[] = [
    new Category($r('app.media.back'),'水手之家'),
    new Category($r('app.media.fabiao'),'吃喝玩乐'),
    new Category($r('app.media.huifu'),'就业创业'),
    new Category($r('app.media.bumen'),'新生专区'),
    new Category($r('app.media.daoju'),'二手专区'),
    new Category($r('app.media.pinglun'),'校园热点')
  ]
  tabsData : Tab[] = [
    new Tab(0, "今日热门", this.myCategories),
    new Tab(1, "前程似锦", this.myCategories),
    new Tab(2, "成电校园", this.myCategories),
    new Tab(3, "科技学术", this.myCategories),
    new Tab(4, "生活信息", this.myCategories),
    new Tab(5, "休闲娱乐", this.myCategories),
    new Tab(6, "站务管理", this.myCategories)
  ]
  @Builder TabBuilder(title: string, targetIndex: number){
    Column(){
      Text(title).fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }.width('100%').height(50).justifyContent(FlexAlign.Center)
  }

  build() {
    Column(){
      Text("板块列表").fontSize(25).width("100%").textAlign(TextAlign.Center).margin(20)
      Tabs({barPosition: BarPosition.Start, controller: this.tabController}){
        ForEach(this.tabsData, (value:Tab, index: number) => {
          TabContent(){
            Grid(){
              ForEach(value.content, (value:Category, index: number) => {
                GridItem(){
                  Button(){
                    Column({space:7}){
                      Image(value.img).width(35).height(35).borderRadius(20)
                      Text(value.name).fontSize(15)
                    }
                  }.type(ButtonType.Normal).backgroundColor(Color.Transparent)
                  .onClick(() => {
                    router.pushUrl({
                      url: 'pages/subbankuai'
                    })
                  })
                }

              })
            }.columnsTemplate("1fr 1fr 1fr")
            .columnsGap(20)
            .rowsGap(20)

          }.tabBar(this.TabBuilder(value.name, value.id)).margin({top:20})
        })

      }
      .scrollable(true)
      .barHeight("100%")
      .vertical(true)
      .barWidth("20%")

      .onChange((index) => {
        this.currentIndex = index
      })
    }

  }
}