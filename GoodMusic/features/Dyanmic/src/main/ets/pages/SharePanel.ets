import ShareAppItem from '../viewmodel/ShareAppItem'

@Component

export default struct SharePanel {
  Shares:ShareAppItem[] = [
    new ShareAppItem($r('app.media.shareApp1'),'微信朋友圈'),
    new ShareAppItem($r('app.media.headImage2'),'微信好友'),
    new ShareAppItem($r('app.media.shareApp3'),'QQ空间'),
    new ShareAppItem($r('app.media.headImage4'),'QQ好友'),
    new ShareAppItem($r('app.media.shareApp6'),'微博'),
    new ShareAppItem($r('app.media.shareApp7'),'钉钉'),
    new ShareAppItem($r('app.media.shareApp8'),'复制链接'),
  ]
  build() {
    Column(){


      Row(){
           List(){
      ForEach(this.Shares,(item:ShareAppItem)=>{
        ListItem(){
        this.ShowApp({ShareAppimg:item.ShareAppimg, AppName:item.AppName })
        }
      })
           }
        .listDirection(Axis.Horizontal)

      }
    }

  }
  @Builder ShowApp($$:{
    ShareAppimg:ResourceStr
    AppName:string
  }){
          Column(){
            Image($$.ShareAppimg)
              .width(70)
            Text($$.AppName)
          }





}
}