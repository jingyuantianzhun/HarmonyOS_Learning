
import PlayNav from '../components/PlayNav'

import Constants, { SPACE } from '../constants/Constants'
import MenuPerson from '../dialog/MenuPerson'
import Recommend from '../view/Recommend'
import {FindIndex} from 'find'
import {DynamicIndex} from 'dyanmic'
import router from '@ohos.router'
import SongItem from '../viewmodel/SongItem'
import { songs1 } from '../model/Model'
import {UserIndex} from 'user'


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State currentIndex: number = 0
  @State isShow:boolean = false
  @State musicList:SongItem[] = songs1
  //设置模态
  @Provide song:SongItem[] = songs1


  setModal(is:boolean){
    return is?0.4:1
  }

  @Builder tabBarBuilder1(image: Resource, text: Resource, index: number) {
    Column({space:4}) {


      Row(){
        Image(image).width(35).fillColor(this.selectColor2(index))
      }.width(40).borderRadius(20).backgroundColor(this.selectColor1(index))
      .justifyContent(FlexAlign.Center).height(40)
      Text(text).fontColor(this.selectColor(index)).fontSize(13)

    }
    .onClick(()=>{
      router.pushUrl({
        url:"pages/PlayComponent",
        params: {
          musicList:this.musicList as SongItem[]
        }
      })
    })
  }

  @Builder tabBarBuilder(image: Resource, text: Resource, index: number) {
    Column({space:4}) {


      Row(){
        Image(image).width(35).fillColor(this.selectColor2(index))
      }.width(40).borderRadius(20).backgroundColor(this.selectColor1(index))
      .justifyContent(FlexAlign.Center).height(40)
      Text(text).fontColor(this.selectColor(index)).fontSize(13)

    }
  }

  selectColor2(index:number){
    return this.currentIndex ===
           index ? $r('app.color.selected1') : $r('app.color.unselected')
  }


  selectColor1(index:number){
    return this.currentIndex ===
           index ? $r('app.color.selected') : $r('app.color.selected1')
  }

  selectColor(index: number) {
    return this.currentIndex ===
           index ? $r('app.color.selected') : $r('app.color.unselected')
  }

  build() {

    Column(){

      Stack(){
        Stack(){

          Tabs({barPosition:BarPosition.End}) {
            //1.推荐模块
            TabContent() {
              Recommend()
            }.tabBar(this.tabBarBuilder($r('app.media.recommend'),$r('app.string.recommend'),0))

            //2.发现模块
            TabContent() {
              FindIndex()
            }.tabBar(this.tabBarBuilder($r('app.media.discover'),$r('app.string.discover'),1))
            //3.播放模块
            TabContent() {
            }.tabBar(this.tabBarBuilder1($r("app.media.play_main"),$r('app.string.play'),2))

            //4.动态模块
            TabContent() {
              DynamicIndex()
            }.tabBar(this.tabBarBuilder($r('app.media.dynamic'),$r('app.string.dynamic'),3))
            //5.我的模块
            TabContent() {
              UserIndex()
            }.tabBar(this.tabBarBuilder($r('app.media.mine'),$r('app.string.mine'),4))

          }
          .onChange(index => this.currentIndex = index)
          .padding({bottom:SPACE.SPACE_15,top:SPACE.SPACE_15,left:SPACE.SPACE_8})


          Image($r('app.media.menu')).width(Constants.SIZE_30).margin({top:SPACE.SPACE_25})
            .onClick(()=>{
              animateTo({
                duration:500,
                curve:Curve.Linear
              },()=>{
                this.isShow = true
              })
            })

          PlayNav()
            .position({
              x:'0%',
              y:'82.9%'
            })
            .backgroundColor(Color.White)

        }
        .opacity(this.setModal(this.isShow))
        .width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
        .alignContent(Alignment.TopStart).margin({top:SPACE.SPACE_10})
        .margin({bottom:SPACE.SPACE_10})



        //menu面板
        if(this.isShow){
          MenuPerson()
            .position({x:-10})
            .transition({
              type:TransitionType.All

            })

        }
      }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
      .onClick(()=>{
        animateTo({
          duration:500,
          curve:Curve.Linear
        },()=>{
          if(this.isShow){
            this.isShow = false
          }
        })

      })


    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)





  }
}