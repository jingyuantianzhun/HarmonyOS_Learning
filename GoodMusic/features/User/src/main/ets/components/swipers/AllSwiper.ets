

/**
 * MusicTabBar中的Swiper的子组件:近期
 */

@Entry
@Component
export default struct AllSwiper{

  @State musics:Array<string>=['1','2','3']

  @State oldMusics:Array<string>=['1','2','3']

  build(){

    Column({space:20}){

      //歌单列表
      List({space:10}){



        ForEach(this.musics,(item)=>{
          ListItem(){
            Row(){
              Image($rawfile('../../../resources/rawfile/music.jpg'))
                .height(70)
              Column({space:10}){
                Text('有声书名称')
                  .fontSize(20)
                  .fontColor(Color.Black)
                  .opacity(0.6)
                Text('有声书介绍信息')
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
              Text('添加播客和有声书')
                .opacity(0.6)
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


      //你可能喜欢
      Column(){
        Row(){
          Text('为你推荐')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
            .fontColor(Color.Black)
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      //为你推荐（里面是死数据）
      Column(){
        List({space:10}){


          ForEach(this.oldMusics,(item)=>{
            ListItem(){
              Row(){
                Image($rawfile('../../../resources/rawfile/music.jpg'))
                  .height(70)
                Column(){
                  Text('有声书名称')
                    .opacity(0.6)
                    .fontSize(20)
                    .fontColor(Color.Black)
                  Text('有声书介绍')
                    .fontColor($r('app.color.swiper_gray'))
                  Text('520W次播放')
                    .fontColor($r('app.color.swiper_gray'))
                }
                .alignItems(HorizontalAlign.Start)
                .margin({left:10})
              }

              .width('100%')
            }
            .width('100%')
          })
        }
        .width('100%')
      }

    }
    .width('100%')
  }
}