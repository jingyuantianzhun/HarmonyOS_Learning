
import CarouselChart from '../view/find/CarouselChart'
import RecommendedPlaylists from '../view/find/RecommendedPlaylists'
import SongsAndDiscs from '../view/find/SongsAndDiscs'
import DigitalAlbums from '../view/find/DigitalAlbums'
import RankingList from '../view/find/RankingList'
import YunCun from '../view/find/YunCun'
import ExploreMore from '../view/find/ExploreMore'

// import {ListView,RefreshController} from '@abner/refresh'

@Entry
@Component
export struct FindIndex {
  private HeaderCard:string[]=[' ','音乐','播客','派对','直播','听书','      ']
  @State currentIndexFTabs: number = 1
  @State currentIndexSTabs: number = 0
  private SelectCard:string[]=['精选','排行榜','VIP','经典','国风','民谣','全球','DJ','助眠','摇滚','   ']

  @Builder TabBuilderFTabs(name: string, index: number) {
    Column() {
      Text(name)
        .fontSize(18)
        .fontColor(this.selectColorFTabs(index))
        .borderRadius(20)
        .padding({left:10,right:10,top:5,bottom:5})
        .fontWeight(FontWeight.Bold)
      if(this.selectLine(index)) {
        Image($r('app.media.underline'))
          .width(20)
          .fillColor(Color.Red)
          .position({x:20,y:25})
      }
    }
    .margin({left:15})
  }

  selectColorFTabs(index: number) {
    return this.currentIndexFTabs === index ?  Color.Black:Color.Gray
  }

  selectLine(index:number){
    return this.currentIndexFTabs === index ?  true:false
  }

  @Builder TabBuilderSTabs(name: string, index: number) {
    Row() {
      Text(name)
        .backgroundColor(this.selectColorSTabs(index))
        .borderRadius(20)
        .padding({left:10,right:10,top:5,bottom:5})
    }
    .margin({left:15})
  }

  selectColorSTabs(index: number) {
    return this.currentIndexSTabs === index ?  '#E8E8E8':Color.White
  }


  // @State controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量
  // array:Component=new Component()

  build() {
    Column() {
      Row({ space: 10 }) {
        Stack() {
          //1.导航图标
          // Image($r("app.media.navigation"))
          //   .zIndex(100)
          //   .width(50)
          //   .height(50)
          //   .position({ x: 0, y: 3 })
          //   .padding(10)
          //   .fillColor(Color.Black)
          //   .backgroundColor(Color.White)

          Tabs({ barPosition: BarPosition.Start }) {
            ForEach(this.HeaderCard, (item, indexFTabs) => {
              TabContent() {
                if(indexFTabs==1){
                  Stack(){
                    Tabs({ barPosition: BarPosition.Start}) {
                      ForEach(this.SelectCard,(item,indexSTabs)=>{
                        TabContent() {
                          if(indexSTabs==0){
                            List({space:10}){
                              ListItem(){
                                CarouselChart()
                              }
                              ListItem(){
                                RecommendedPlaylists()
                              }
                              ListItem(){
                                SongsAndDiscs()
                              }
                              ListItem(){
                                DigitalAlbums()
                              }
                              ListItem(){
                                RankingList()
                              }
                              ListItem(){
                                YunCun()
                              }
                              ListItem(){
                                ExploreMore()
                              }
                              ListItem(){
                                Row(){
                                  Blank(10)
                                }
                                .height(100)
                              }
                            }
                          }
                        }.tabBar(this.TabBuilderSTabs(item,indexSTabs))
                      })
                    }
                    .barMode(BarMode.Scrollable)
                    .onChange(indexSTabs => this.currentIndexSTabs = indexSTabs)
                    Image($r("app.media.dropdownp"))
                      .width(40)
                      .height(40)
                      .position({x:320,y:8})
                      .padding(10)
                      .backgroundColor(Color.White)
                  }
                }
              }.tabBar(this.TabBuilderFTabs(item, indexFTabs))
            })
          }
          .barMode(BarMode.Scrollable)
          .onChange(indexFTabs => this.currentIndexFTabs = indexFTabs)

          Image($r('app.media.searchfor'))
            .zIndex(100)
            .width(55)
            .height(55)
            .position({ x: 305, y: 1 })
            .padding(10)
            .fillColor(Color.Black)
            .backgroundColor(Color.White)
        }
        // .alignContent(Alignment.TopStart)
      }
      .width('100%')
      .margin(10)
    }
  }
}