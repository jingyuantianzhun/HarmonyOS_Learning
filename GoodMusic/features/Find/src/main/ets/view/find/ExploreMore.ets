
@Component
export default struct ExploreMore {
  @State title:string='探索更多'
  MoreList:string[]=['按曲风浏览','按歌手浏览','音乐专区','歌单广场','宝藏曲库']
  build() {
    Column() {
      Row() {
        Text(this.title)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin(10)
      }

      List({space:10}){
        ForEach(this.MoreList,(item,index)=>{
          ListItem() {
            Column() {
              Row() {
                Text(item)
                  .fontSize(20)
                  .fontWeight(FontWeight.Medium)
                  .margin(10)
                Image($r('app.media.DropRight'))
                  .width(15)
                  .height(15)
              }
              if(index<this.MoreList.length-1) {
                Divider()
                  .margin({ top: 10 ,left:10})
                  .width(350)
              }
            }
            .alignItems(HorizontalAlign.Start)
          }
        })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .margin(10)
  }
}