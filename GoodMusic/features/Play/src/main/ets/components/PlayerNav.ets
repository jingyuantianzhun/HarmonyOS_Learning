

@Component

//小型播放导航栏
export struct PlayerNav {
  build() {
    Row() {
      Row({space:10}) {
        Image($r('app.media.rs1')).width(40)
        //歌名 作者信息
        Column() {
          Text('歌名')
            .fontColor('#fff')
          Text("作者")
            .fontSize(12)
            .fontColor('#ccc')
        }.alignItems(HorizontalAlign.Start)
      }.height('100%')
      .alignItems(VerticalAlign.Center)
      Row({space:20}) {
        Image($r("app.media.last_music"))
          .width(18)
          .fillColor('#4cafc6')
        Image($r('app.media.stop'))
          .fillColor('#4cafc6')
          .width(22)

        Image($r('app.media.next_music'))
          .width(18)
          .aspectRatio(1)
          .fillColor('#4cafc6')
      }.height('100%')
    }
    .width('100%')
    .height(40)
    .backgroundColor('#ffffff')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

export default PlayerNav