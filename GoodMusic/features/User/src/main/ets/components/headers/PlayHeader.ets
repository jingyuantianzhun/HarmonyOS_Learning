import router from '@ohos.router'


@Component
export struct PlayHeader{


  build(){

    Column(){
      Row({space:10}){
        Image($rawfile('../../../resources/rawfile/back.svg'))
          .height(25)
          .interpolation(ImageInterpolation.High)
          .fillColor(Color.White)
          .onClick(()=>{
            router.back()
          })

        Text('歌单')
          .fontSize(20)
          .fontColor(Color.White)


        Blank()

        Image($rawfile('../../../resources/rawfile/search_white.svg'))
          .height(25)
          .interpolation(ImageInterpolation.High)


        Image($rawfile('../../../resources/rawfile/sandian.svg'))
          .height(20)
          .fillColor(Color.White)
          .interpolation(ImageInterpolation.High)

      }
      .width('100%')
      // .padding(15)
    }
    .width('100%')
  }
}