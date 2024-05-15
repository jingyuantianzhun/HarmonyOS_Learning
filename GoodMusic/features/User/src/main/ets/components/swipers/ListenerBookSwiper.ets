

/**
 * MusicTabBar中的Swiper的子组件:近期
 */

@Entry
@Component
export default struct ListenerBookSwiper{

  @State musics:Array<string>=['1','2','3']


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
                  .opacity(0.6)
                  .fontSize(20)
                  .fontColor(Color.Black)
                Text('有声书介绍')
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
              Text('添加更多有声书')
                .fontSize(20)
                .opacity(0.8)
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




    }
    .width('100%')
  }
}