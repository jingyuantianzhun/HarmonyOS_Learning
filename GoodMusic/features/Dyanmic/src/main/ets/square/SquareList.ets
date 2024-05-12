import { comments } from '../model/CommentModel'
import CommentItem from '../viewmodel/CommentItem'

@Component
export default struct SquareList {
  @State isRefresh:boolean = false
  showPanel:()=>void
   @Builder ItemCard(items:CommentItem[]){
     List(){
       ForEach(items,(item:CommentItem)=>{
         ListItem(){
           // Refresh({ refreshing: this.isRefresh, offset: 16, friction: 50 }) {
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

                 Text('根据你的常听推荐')
                   .fontColor(Color.Gray)
                   .fontSize(14)
                   .margin({right:220})
               }
             }
             Text(item.comment)
               .margin({right:30})
             Image(item.commentImg)
               .width(170)
               .height(200)
               .margin({right:30,top:20})
               .borderRadius(10)
             Row(){
               Image(item.song.songPicture)
                 .width(40)
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

           // }.onRefreshing(()=>{
           //   setTimeout(()=>{this.isRefresh = !this.isRefresh},1000)
           // })

         }

       })
     }

   }

  build() {
    this.ItemCard(comments)
  }
}