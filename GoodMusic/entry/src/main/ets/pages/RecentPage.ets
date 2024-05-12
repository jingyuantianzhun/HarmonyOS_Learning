import {ExtendPageHeader} from 'user'

//首页“最近”按钮跳转的目标页面
@Entry
@Component
struct RecentPage {

  @State titles:Array<string>=['最近播放']

  @State currentIndex:number=0

  @State smallTitles:Array<string>=['歌曲','声音','有声书','直播','歌单','专辑','视频','播客']

  private controller:Scroller=new Scroller()

  @Builder tabBarBuilder(title:string,index:number){

    Badge({count:1,maxCount:99,style:{
      badgeColor:Color.Transparent,
      color:this.currentIndex===index?Color.Black:$r('app.color.swiper_gray'),
      fontSize:15
    }}){
      Column(){
        Text(title)
          .fontSize(this.currentIndex===index?20:18)
          .padding({left:20,right:15,bottom:15})
          .fontColor(this.currentIndex===index?Color.Black:$r('app.color.swiper_gray'))
      }
      .height(28)
      .onClick(()=>{
        this.currentIndex=index
      })
    }

  }

  build() {
    Row() {
      Column() {
        //页面头部
        ExtendPageHeader({titles:this.titles})

        //小标题
        Tabs(){
          ForEach(this.smallTitles,(item,index)=>{
            TabContent(){
              Text(item)
            }
            .tabBar(this.tabBarBuilder(item,index))
          })

        }
        .barMode(BarMode.Scrollable)
        .barWidth('94%')


      }
      .width('100%')
    }
    .height('100%')
  }
}