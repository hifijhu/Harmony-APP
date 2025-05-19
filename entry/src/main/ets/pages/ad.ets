import { router } from '@kit.ArkUI'

@Entry
@Component
export struct Ad {
  build() {
    Column(){
      Image($r('app.media.night')).height("100%").width("100%")
    }
  }

  onPageShow(): void {
    setTimeout(()=>{
      router.pushUrl({
        'url': 'pages/main'
      })
    },2000)
  }
}