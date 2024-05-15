import router from '@ohos.router'
import { attentions } from '../model/AttentionModel'
import AttentionItem from '../viewmodel/AttentionItem'
import SongItem from '../viewmodel/SongItem'


@Component
export default struct AttentionList {
  showPanel:() => void
  @State isRefresh:boolean = false
  @Consume song:SongItem[]
  @Builder ItemCard(items:AttentionItem[]){
    List(){
      ForEach(items,(item:AttentionItem)=>{

        ListItem(){


    Column(){


      Row(){
        Image(item.headImage)
          .width(50)
          .borderRadius(40)

          .margin({right:10})

        Column(){
          Row(){
            Text(item.name)
              .fontColor(Color.Black)
              .margin({right:10})
              .fontSize(15)
            Image($r('app.media.vip'))
              .width(25)
              .height(20)
              .borderRadius(20)
          }
          .margin({left:28})
          .width('100%')
          Text(item.time)
            .fontColor(Color.Gray)
            .fontSize(14)
            .margin({right:290})
        }
      }
      Text(item.comment)
        .margin({right:30})
        .fontSize(14)
      Image(item.commentImg)
        .width(170)
        .height(200)
        .margin({right:30,top:20})
        .borderRadius(10)
      Row(){
        Image(item.song.songPicture)
          .width(40)
          .onClick(()=>{
            AppStorage.SetOrCreate('selectIndex',0)
            router.pushUrl({
              url:"pages/PlayComponent",
              params:{
                musicList:this.song as SongItem[]
              }
            })
          })
        Column(){
          Text(item.song.songName)
            .fontSize(15)
          Text(item.song.songWriter)
            .fontColor(Color.Gray)
            .fontSize(10)
        }
      }
      .backgroundColor('#EDEFF2')
      .width('70%')
      .height(50)
      .margin({left:50,top:10})
      .borderRadius(10)
      Row(){
        Image($r('app.media.share'))
          .width(20)
          .fillColor(Color.Gray)
          .margin({left:80})
        Text('分享')
          .fontColor(Color.Gray)
          .fontSize(12)

        Image($r('app.media.comment'))
          .fillColor(Color.Gray)
          .width(20)
          .margin({left:20})

        Text(item.song.NumberOfReviews)
          .fontSize(12)
          .fontColor(Color.Gray)
        Image($r('app.media.good'))
          .fillColor(Color.Gray)
          .width(20)
          .margin({left:20})
        Text(item.song.likeNumber)
          .fontSize(12)
          .fontColor(Color.Gray)
        Image($r('app.media.hidden_choose'))
          .fillColor(Color.Gray)
          .width(20)
          .margin({left:80})
          .onClick(()=>this.showPanel())

      }
      .width('100%')
      .margin(15)

      Divider()
    }

  }

})
}
  }



  build() {
Column(){
  Row({space:20}){
    Column(){
      Image($r('app.media.friend1'))
        .width(50)
      Text('乐迷团')
        .fontSize(15)
        .fontColor(Color.Gray)
    }
    .margin({left:12})
    Column(){
      Image($r('app.media.friend2'))
        .width(50)
      Text('网易CEO丁磊')
        .fontSize(15)
        .fontColor(Color.Gray)
    }
    Column(){
      Image($r('app.media.friend3'))
        .width(50)
      Text('全部好友')
        .fontSize(15)
        .fontColor(Color.Gray)
    }
  }
  .width('100%')

  Row(){
    Text('我的关注')
      .fontWeight(FontWeight.Bold)
      .margin({left:15})
      .fontSize(15)
    Text('全部 |')
      .margin({left:140})
      .fontSize(15)
    Text('音乐人 |')
      .margin({left:10})
      .fontSize(15)

    Text('朋友')
      .margin({left:10})
      .fontSize(15)

  }
  .margin(20)
  .width('100%')


        // Refresh({ refreshing: this.isRefresh, offset: 16, friction: 10 }) {
        this.ItemCard(attentions)
      // }.onRefreshing(()=>{
      //   setTimeout(()=>{this.isRefresh = !this.isRefresh},1000)
      // })

}


  }
}