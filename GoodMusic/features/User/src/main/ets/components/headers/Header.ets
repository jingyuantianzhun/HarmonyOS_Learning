





@Entry
@Component
export default struct Header{

  changeShow:()=>void

  build(){

    Column(){
      Stack(){

        Row(){

          Badge({count:1,maxCount:99,position:BadgePosition.RightTop,style:{
            badgeColor:'#ffff0505',
          }}){
            Image($rawfile('../../../resources/rawfile/sanxian.svg'))
              .height(25)
              .interpolation(ImageInterpolation.High)
              .padding({right:10})
          }

          Blank()


          Row({space:10}){
            Image($rawfile('../../../resources/rawfile/sreach.svg'))
              .height(25)
              .interpolation(ImageInterpolation.High)

            Image($rawfile('../../../resources/rawfile/sandian.svg'))
              .height(25)
              .interpolation(ImageInterpolation.High)
          }

        }
        .justifyContent(FlexAlign.Start)
        .width('100%')
        // .padding({left:10,right:10})
        // .margin(20)
        Text('+添加状态')
          .fontColor('#ffdddddd')
          .onClick(()=>{
            this.changeShow()
          })
      }
      .margin({left:10,right:10,top:20,bottom:20})
    }
    .width('100%')

  }
}