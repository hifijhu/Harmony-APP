import { router } from '@kit.ArkUI';
import preferences from '@ohos.data.preferences';
import { common } from '@kit.AbilityKit';


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  context = getContext(this) as common.UIAbilityContext
  aboutToDisappear(): void {
  }// 组件消失

  aboutToAppear(): void {
    preferences.getPreferences(this.context, 'mystr', (err, mypreference) => {
      if(err){
        return
      }
      console.info('Succeed!')

      try{
        mypreference.has('isfirst', (err, val) => {
          if (err) {
            return;
          }
          if (val) {
          } else {
          }
        })
      }catch(err){
        console.error("Failed to check the key 'startup'. Code: ${err.code}, message: ${err.message}")
      } // 异常捕捉，防止app闪退
    })
  }// 组件显示
  build() {
    Column(){
      Image($r('app.media.foreground'))
    }
  }

  //页面是由多个自定义组件组成的，所以先有组件生命周期再有页面生命周期
  onPageShow(): void {
    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/main'
      })
    }, 1000)
  }// 页面显示

  onPageHide(): void {
  }// 页面隐藏，消失的时候

  onBackPress(): boolean | void {
  }// 设备上的返回键
}

/*

* 数据存储--之Preferences 全局唯一存储，轻量级数据，存储Key-Value键值型的数据
* Preferences会将数据缓存在内存中，当用户读取的时候，能够快速从内存中获取数据
* 当需要持久化时可以使用flush接口将内存中的数据写入持久化文件中
*
* Preferences会随着存放的数据量越多而导致应用占用的内存越大
* 因此Preferences不适合存放过多的数据
 */