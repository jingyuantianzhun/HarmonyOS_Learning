import router from '@ohos.router'

/**
 * MusicTabBar中的Swiper的子组件:近期
 */

@Entry
@Component
export default struct RecentSwiper{

  @State musics:Array<string>=['1','2','3']

  @State oldMusics:Array<string>=['1','2','3']

  build(){

    Column({space:20}){

      //歌单列表
      List({space:10}){

        ListItem(){
          Row(){
            Image($rawfile('../../../resources/rawfile/xihuan.jpg'))
              .height(70)

            Column({space:10}){
              Text('我喜欢的音乐')
                .fontSize(20)
                .fontColor(Color.Black)
              Text('0首·1次播放')
                .fontColor($r('app.color.swiper_gray'))

            }
            .alignItems(HorizontalAlign.Start)
            .margin({left:10})
            .onClick(()=>{
              router.pushUrl({
                url:"pages/PlayPage"
              })
            })
          }
          .width('100%')
        }
        .width('100%')

        ForEach(this.musics,(item)=>{
          ListItem(){
            Row(){
              Image($rawfile('../../../resources/rawfile/music.jpg'))
                .height(70)
              Column({space:10}){
                Text('歌单名称')
                  .fontSize(20)
                  .fontColor(Color.Black)
                Text('歌单·0首·用户网名')
                  .fontColor($r('app.color.swiper_gray'))
              }
              .alignItems(HorizontalAlign.Start)
              .margin({left:10})
              .onClick(()=>{
                router.pushUrl({
                  url:"pages/PlayPage"
                })
              })
            }

            .width('100%')
          }
          .width('100%')
        })


        ListItem(){
          Row(){
            Image($rawfile('../../../resources/rawfile/create.jpg'))
              .height(70)
            Column(){
              Text('新建歌单')
                .fontSize(20)
                .fontColor(Color.Black)
            }
            .alignItems(HorizontalAlign.Start)
            .margin({left:10})
          }
          .width('100%')
        }
        .width('100%')

      }
      .width('100%')


      Row(){
        Text('展示创建/收藏30条内容，该列表仅自己可见')
          .fontColor($r('app.color.swiper_gray'))
          .fontSize(15)
      }

      //你可能喜欢
      Column(){
        Row(){
          Text('你可能喜欢')
            .fontWeight(FontWeight.Bold)
            .fontSize(16)
            .fontColor(Color.Black)
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      //你可能喜欢的歌单列表
      Column(){
        List({space:10}){

          ListItem(){
            Row(){
              Image($rawfile('../../../resources/rawfile/xihuan.jpg'))
                .height(70)

              Column({space:10}){
                Text('我喜欢的音乐')
                  .fontSize(20)
                  .fontColor(Color.Black)
                Text('0首·1次播放')
                  .fontColor($r('app.color.swiper_gray'))

              }
              .alignItems(HorizontalAlign.Start)
              .margin({left:10})
            }
            .width('100%')
          }
          .width('100%')

          ForEach(this.oldMusics,(item)=>{
            ListItem(){
              Row(){
                Image($rawfile('../../../resources/rawfile/music.jpg'))
                  .height(70)
                Column({space:10}){
                  Text('歌单名称')
                    .fontSize(20)
                    .fontColor(Color.Black)
                  Text('歌单·0首·用户网名')
                    .fontColor($r('app.color.swiper_gray'))
                }
                .alignItems(HorizontalAlign.Start)
                .margin({left:10})
              }

              .width('100%')
            }
            .width('100%')
          })


          ListItem(){
            Row(){
              Image($rawfile('../../../resources/rawfile/create.jpg'))
                .height(70)
              Column(){
                Text('新建歌单')
                  .fontSize(20)
                  .fontColor(Color.Black)
              }
              .alignItems(HorizontalAlign.Start)
              .margin({left:10})
            }
            .width('100%')
          }
          .width('100%')


          ListItem(){
            Row()
              .height(70)
          }
          ListItem(){
            Row()
              .height(70)
          }

        }
        .width('100%')
      }

    }
    .width('100%')
  }
}