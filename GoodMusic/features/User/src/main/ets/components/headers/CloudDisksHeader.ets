import router from '@ohos.router'


@Component
export struct CloudDisksHeader{

  build(){

    Column(){
      Row(){
        Image($rawfile('../../../resources/rawfile/back.svg'))
          .interpolation(ImageInterpolation.High)
          .height(25)
          .onClick(()=>{
            router.back()
          })

        Column(){
          Text('音乐云盘')
            .fontSize(20)
            .fontColor(Color.Black)
          Text('0.0G/5G')
            .fontColor($r('app.color.swiper_gray'))
        }

        Image($rawfile('../../../resources/rawfile/soushou.svg'))
          .height(25)
          .interpolation(ImageInterpolation.High)

      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding(15)
    }
    .width('100%')

  }
}