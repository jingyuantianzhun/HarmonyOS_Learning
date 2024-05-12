import { User } from '../bean/User'

@Extend(Text) function text_style1(){
  .fontSize(15)
  .fontColor($r('app.color.color_shenGray'))

}
@Extend(Text) function text_style2(){
  .fontSize(17)
  .fontColor($r('app.color.color_white'))
  .fontWeight(FontWeight.Bold)
}

@Component
export default struct UserMessage{

  @State image:Resource=$rawfile('../../resources/rawfile/user.jpg')

  @Link user:User

  private currentDate:Date=new Date()

  @Builder address(){
    Row({space:4}){
      Text(this.user.region.province)
        .text_style1()
      Text(this.user.region.city)
        .text_style1()
    }
  }

  build(){

    Column({space:10}){
      //头像
      Image(this.user.image)
        .height(100)
        .borderRadius(50)
        .interpolation(ImageInterpolation.High)
        .margin({top:20,bottom:10})

      //网名
      Row(){
        Text(this.user.name)
          .fontSize(25)
          .fontColor($r('app.color.color_white'))
        Image($rawfile('../../resources/rawfile/vip.png'))
          .height(20)
      }
      //个人地址信息
      Row({space:4}){
          Image($rawfile('../../resources/rawfile/huizhang.svg'))
            .height(15)
            .fillColor($r('app.color.color_shenGray'))
          Text('0枚徽章')
            .text_style1()

          Divider()
            .vertical(true)
            .height(10)
            .color($r('app.color.color_shenGray'))
            .margin({left:10,right:10})
            .strokeWidth(1)
            .opacity(0.8)

          // Text('江西')
          //   .text_style1()
          // Text('南昌')
          //   .text_style1()
          this.address()
          Text(`·`)
            .text_style1()
            .fontWeight(FontWeight.Bold)
          Text(`村龄${Math.floor((this.currentDate.getTime()-this.user.createDate.getTime())/1000/60/60/24)}天`)
            .text_style1()

        }
      //个人粉丝信息
      Row({space:10}){
        Row({space:3}){
          Text(`${this.user.concernNumber}`)
            .text_style2()
          Text(`关注`)
            .text_style1()
        }

        Row({space:4}){
          Text(`${this.user.fansNumber}`)
            .text_style2()
          Text(`粉丝`)
            .text_style1()
        }

        Row({space:3}){
          Text(`Lv.${this.user.cloudMusicGrade}`)
            .text_style2()
          Text(`等级`)
            .text_style1()
        }

        Row({space:3}){
          Text(`0时`)
            .text_style2()
          Text(`听歌`)
            .text_style1()
        }

      }
      // .margin(15)

    }
    .width('100%')


  }
}