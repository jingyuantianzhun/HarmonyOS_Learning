import router from '@ohos.router'

@Entry
@Component
struct AppPanelIndex {
  build() {
    Column(){
      this.PanelButton()
      TextInput({placeholder:'写下这一刻的想法...'})
        .width('100%')
        .height('40%')
        .type(InputType.Normal)
        .placeholderColor('#D3D3D3')
        .placeholderFont({size:30})
        .backgroundColor(Color.White)
        .textAlign(TextAlign.Start)
        Row(){
          Image($r('app.media.music_choose'))
            .margin({left:10})
            .width(40)
            Text('添加音乐')
              .fontSize(15)
            .layoutWeight(1)

          Image($r('app.media.moreMusic'))
            .margin({right:10})
            .width(20)
        }
      .width('90%')
      .height(60)
      .backgroundColor('#F8F8F9')
    }

    .width('100%')
    .height('100%')

  }


  @Builder PanelButton(){
    Row(){
      Text('取消')
        .width(50)
        .height(50)
        .fontSize(20)
        .onClick(()=>{
          router.showAlertBeforeBackPage({
            message:'确定取消发布动态'
          })
          router.back()
        })


      Text('发图文')
        .layoutWeight(1)
        .fontSize(23)
        .margin({left:90})

     Button('发布')

       .type(ButtonType.Capsule)
       .backgroundColor(Color.Red)
       .width(60)
       .height(30)

    }
    .width('100%')
  }
}