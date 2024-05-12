import { userSong1 } from '../viewmodel/SongItem'
import {UserSong} from '../viewmodel/UserSong'

@Component
export default struct PlayListItem{

  @Prop index:number

  @ObjectLink item:UserSong

  build(){



    Row(){
      Text((this.index+1)+'')
        .width(20)
      Row(){
        Column({space:4}){
          Row(){
            Text(this.item.name)
              .fontSize(16)
          }
          Row({space:5}){
            Image($rawfile('../../resources/rawfile/aixinshoucang.svg'))
              .height(15)
              .interpolation(ImageInterpolation.High)
              .fillColor(this.item.isCollection?Color.Red:$r('app.color.swiper_gray'))
              .onClick(()=>{
                this.item.isCollection=!this.item.isCollection
                // userSong1[this.index].isCollection=!userSong1[this.index].isCollection
              })
            Text(this.item.typeDescription)
              .fontSize(10)
              .border({style:BorderStyle.Solid,width:1,color: '#ffa77a2a' })
              .fontColor('#ffa77a2a')
              .borderRadius(5)
              .padding(2)
            Text(this.item.author)
              .fontSize(12)
              .fontColor($r('app.color.swiper_gray'))
            // Text('简介')
            //   .fontColor($r('app.color.swiper_gray'))
          }
        }
        .alignItems(HorizontalAlign.Start)
        Blank()

        Image($rawfile('../../resources/rawfile/sandian.svg'))
          .height(20)
          .fillColor($r('app.color.swiper_gray'))
      }
      .width('100%')
      // .border({style:BorderStyle.Solid,width:1})
    }
    .width('88%')
  }
}