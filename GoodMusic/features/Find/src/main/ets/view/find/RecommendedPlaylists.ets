
@Component
export default struct RecommendedPlaylists {
  // @Prop title:string='甄选歌单'
  @State title:string='甄选歌单'
  @State Recommend:Resource[]=[$r('app.media.SelectSongA'),$r('app.media.SelectSongB'),
    $r('app.media.SelectSongC'),$r('app.media.SelectSongD'),$r('app.media.SelectSongE')]
  @State introduction:string[]=['治愈华语 | 放轻松~每个人都有自己的小世界','这叫中文说唱','【日系治愈】那些动漫番 你被治愈了吗',
  '摇滚 | 躲在热闹中散场','RAP合辑 | 说唱带福 思绪全无']
  RecommendCount:number[]=[632,754,2346,1220,2594]
  @State playPhoto:Resource[]=[$r('app.media.pause'),$r('app.media.pause'),$r('app.media.pause'),
    $r('app.media.pause'),$r('app.media.pause')]

  build() {
    Column() {
      Row() {
        Text(this.title)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .margin(10)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      Row(){
        List({space:10}){
          ForEach(this.Recommend,(item:Resource,index)=>{
            ListItem(){
              Column() {
                Stack() {
                  Image(item)
                    .width(110)
                    .height(110)
                    .borderRadius(10)
                  Row({space:2}){
                    Image($r('app.media.headset'))
                      .fillColor(Color.White)
                      .width(10)
                    Text(this.RecommendCount[index].toString())
                      .width(50)
                      .fontSize(10)
                      .fontColor(Color.White)
                      .backgroundColor(Color.Transparent)
                  }
                  .position({x:10,y:10})
                  Image(this.playPhoto[index])
                    .width(30)
                    .height(30)
                    .fillColor(Color.White)
                    .position({x:80,y:80})
                    .onClick(()=>{
                      if(JSON.stringify(this.playPhoto[index])==JSON.stringify($r('app.media.pause'))){
                        this.playPhoto[index]=$r('app.media.wave')
                      }else{
                        this.playPhoto[index]=$r('app.media.pause')
                      }
                      for(var i=0;i<this.playPhoto.length;i++){
                        // console.log('testError',i)
                        // console.log('testError',i!=index)
                        // console.log('testError',JSON.stringify(this.playPhoto[i])==JSON.stringify($r('app.media.wave')))
                        if(JSON.stringify(this.playPhoto[i])==JSON.stringify($r('app.media.wave'))&&(i!=index)){
                          console.log('testError','同时只能播放一个！')
                          this.playPhoto[i]=$r('app.media.pause')
                        }
                      }
                    })

                }
                Text(this.introduction[index])
                  .width(110)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(2)
                  .letterSpacing(1)
                  .lineHeight(18)
                  .fontSize(14)
                  .margin({top:5})
              }
            }
          })
        }
        .listDirection(Axis.Horizontal)
        .margin({left:10,right:10})
      }
    }
  }
}