import SongItem from '../model/SongItem'
import { userSong1 } from '../viewmodel/SongItem'
import {UserSong} from '../viewmodel/UserSong'
import PlayListItem from './PlayListItem'


@Component
export struct PlayList{

  @State musics:Array<UserSong>=userSong1

  build(){

    if (this.musics.length<=0||this.musics==null){
      Column({space:20}){

        Column(){
          Text('添加歌曲')
            .fontSize(20)
            .fontColor(Color.Red)
            .borderRadius(100)
            .border({style:BorderStyle.Solid,width:1,color:Color.Red})
            .padding({top:10,bottom:10,left:60,right:60})
        }
        .padding(20)

      }
      .backgroundColor(Color.White)
      .height('100%')
      .width('100%')
      .padding({top:10})
      .borderRadius(20)
    }else {
      Column({space:20}){
        Row({space:15}){
          Image($rawfile('../../resources/rawfile/play.svg'))
            .height(20)
          Badge({value:`(1)`,position:BadgePosition.RightTop,style:{
            fontSize:15,
            badgeColor:Color.Transparent,
            color:$r('app.color.color_shenGray'),

          }}){
            Text('播放全部')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .padding({right:15})
          }
          Blank()

          Image($rawfile('../../resources/rawfile/add_music.svg'))
            .height(20)
            .fillColor(Color.Black)
            .interpolation(ImageInterpolation.High)

          Image($rawfile('../../resources/rawfile/load.svg'))
            .height(25)
            .fillColor(Color.Black)
            .interpolation(ImageInterpolation.High)


          Image($rawfile('../../resources/rawfile/music_list.svg'))
            .height(20)
            .fillColor(Color.Black)
            .interpolation(ImageInterpolation.High)
        }
        .width('92%')

        Column(){

          List({space:15}){

            ForEach(this.musics,(item:UserSong,index)=>{
              ListItem(){

                // PlayListItem({index:(index),item:`)

                PlayListItem({index:(item.id-1),item:this.musics[item.id-1]})


                // Row(){
                //   Text((index+1)+'')
                //     .width(20)
                //   Row(){
                //     Column({space:4}){
                //       Row(){
                //         Text(item.name)
                //           .fontSize(16)
                //       }
                //       Row({space:5}){
                //         Image($rawfile('aixinshoucang.svg'))
                //           .height(15)
                //           .interpolation(ImageInterpolation.High)
                //           .fillColor(item.isCollection?Color.Red:$r('app.color.swiper_gray'))
                //           .onClick(()=>{
                //             item.isCollection=!item.isCollection
                //           })
                //         Text(item.typeDescription)
                //           .fontSize(10)
                //           .border({style:BorderStyle.Solid,width:1,color: '#ffa77a2a' })
                //           .fontColor('#ffa77a2a')
                //           .borderRadius(5)
                //           .padding(2)
                //         Text(item.author)
                //           .fontSize(12)
                //           .fontColor($r('app.color.swiper_gray'))
                //         // Text('简介')
                //         //   .fontColor($r('app.color.swiper_gray'))
                //       }
                //     }
                //     .alignItems(HorizontalAlign.Start)
                //     Blank()
                //
                //     Image($rawfile('sandian.svg'))
                //       .height(20)
                //       .fillColor($r('app.color.swiper_gray'))
                //   }
                //   .width('100%')
                //   // .border({style:BorderStyle.Solid,width:1})
                // }
                // .width('88%')
              }
              .width('100%')
            })

          }
          .width('100%')
          .edgeEffect(EdgeEffect.None)
          // .border({style:BorderStyle.Solid,width:1})
          .height('88%')

        }
        .width('98%')


      }
      .backgroundColor(Color.White)
      .height('62%')
      .width('100%')
      .padding({top:10})
      .borderRadius({topLeft:20,topRight:20})
    }

  }
}