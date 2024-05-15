
import router from '@ohos.router'
@Entry
@Component
struct HomePage {

  build() {
    Column() {
      Image($r('app.media.logo'))
        .width('62')
        .height('62')
        .borderRadius('32')
        .margin({top:134})
      Column(){
        Button('手机号登录')
          .width(282)
          .height(38)
          .borderRadius(50)
          .fontColor('#C20C0C')
          .backgroundColor('#fff')
        Button('立即体验')
          .width(282)
          .height(38)
          .borderRadius(50)
          .fontColor('#fff')
          .backgroundColor('transparent')
          .border({
            width:1,
            color:"#fff"
          })
          .margin({
            top:25
          })
          .onClick(()=>{
            router.replaceUrl({
              url:"pages/Index"
            })
          })

      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .position({
         x:0,
         y:'80%'
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor("#ac0606")
  }
}