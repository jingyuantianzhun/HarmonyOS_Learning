import {PlayHeader} from 'user'
import {PlayList} from 'user'
import { userSong1 } from 'user'
import {UserSong} from 'user'

@Entry
@Component
struct PlayPage {



  build() {
    Column() {
      PlayHeader()
        .padding({top:15,bottom:15})
        .width('92%')


      Scroll(){

        Column({space:15}){
          //歌曲信息
          Row({space:10}){

            Image($rawfile('user.jpg'))
              .height(150)
              .borderRadius(10)

            Column({space:10}){
              Text('歌名')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
              Row({space:10}){
                //用户图片
                Image($rawfile('user.jpg'))
                  .height(30)
                  .borderRadius(30)
                  .interpolation(ImageInterpolation.High)

                Row(){
                  Text('用户ID')
                    .fontSize(15)
                    .fontColor(Color.White)
                  Image($rawfile('rightkuohao.svg'))
                    .height(15)
                    .interpolation(ImageInterpolation.High)
                    .fillColor(Color.White)
                }
              }
            }
            .alignItems(HorizontalAlign.Start)
          }
          .alignItems(VerticalAlign.Top)
          .width('100%')
          // .padding({left:15,right:})
          .width('92%')

          Row({space:3}){
            Text('编辑信息')
              .fontColor(Color.White)
            Image($rawfile('rightkuohao.svg'))
              .height(15)
              .fillColor(Color.White)
          }
          .width('100%')
          // .padding({left:15})
          .width('92%')
          .onClick(()=>{
            //跳转到歌曲信息编辑界面

          })

          //分享评论收藏
          Row({space:15}){
            Row({space:5}){
              Image($rawfile('share.svg'))
                .height(20)
                .interpolation(ImageInterpolation.High)
              Text('分享')
                .fontColor(Color.White)
            }
            .backgroundColor('#ffc49292')
            .padding({top:8,bottom:8,left:20,right:20})
            .borderRadius(20)

            Row({space:5}){
              Image($rawfile('pinglun.svg'))
                .height(20)
                .interpolation(ImageInterpolation.High)
              Text('评论')
                .fontColor(Color.White)
            }
            .backgroundColor('#ffc49292')
            .padding({top:8,bottom:8,left:20,right:20})
            .borderRadius(20)

            Row({space:5}){
              Image($rawfile('shoucang.svg'))
                .height(20)
                .interpolation(ImageInterpolation.High)
              Text('收藏')
                .fontColor(Color.White)
            }
            .backgroundColor('#ffc49292')
            .padding({top:8,bottom:8,left:20,right:20})
            .borderRadius(20)
            // .opacity()
          }
          .width('92%')


          //歌单列表
          PlayList()


        }
        .width('100%')
        .height('100%')




      }
      .width('100%')
      // .height('100%')


    }
    .height('100%')
    .backgroundColor('#ff914b4b')
  }
}