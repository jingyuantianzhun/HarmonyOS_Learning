import BoKeTabBar from './IndexTabBars/BoKeTabBar'
import DongTaiTabBar from './IndexTabBars/DongTaiTabBar'
import MusicTabBar from './IndexTabBars/MusicTabBar'


@Component
// @Entry
export default struct IndexTabs{


  //当前选中的TarBar
  @State index:number=0


  @Builder tabBarBuilder(index:number,text:string){
    Column(){
      if (this.index==index){

      }
      Text(text)
        .fontSize(20)
        .fontColor(this.index===index?Color.Black:'#9294A0')
        .fontWeight(this.index===index?FontWeight.Bold:FontWeight.Normal)
    }
  }



  build(){

    Column(){
      Tabs(){
        TabContent(){
          MusicTabBar()
        }
        .tabBar(this.tabBarBuilder(0,'音乐'))
        TabContent(){
          BoKeTabBar()
        }
        .tabBar(this.tabBarBuilder(1,'播客'))
        TabContent(){
          DongTaiTabBar()
        }
        .tabBar(this.tabBarBuilder(2,'动态'))
      }
      .height('100%')
      .backgroundColor(Color.White)
      .borderRadius(20)
      .border({style:BorderStyle.Solid,width:1,color:Color.Black})
      .onChange((index)=>{
        this.index=index
      })
    }
    .width('100%')
  }
}