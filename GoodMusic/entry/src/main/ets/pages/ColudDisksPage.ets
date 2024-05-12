import {CloudDisksHeader} from 'user'

@Entry
@Component
struct ColudDisksPage {
  @State message: string = 'Hello World'

  build() {
    Column({space:10}) {
      // ()
      CloudDisksHeader()

      Image($rawfile('../../resources/rawfile/yunpan.svg'))
        .height(100)
        .margin(20)
        .opacity(0.4)


      Text('上传本地歌曲永久保存，随时随地多端设备畅听你的音乐')
        .width('60%')
        .fontColor($r('app.color.swiper_gray'))
        .textAlign(TextAlign.Center)
        .lineHeight(25)

      Blank()

      Row(){
        Text('上传本地音乐到云盘')
          .fontColor(Color.White)

      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#ffee0f18')
      .borderRadius('100')
      .padding(12)
      .width('80%')

    }
    .width('100%')
    .height('80%')
  }
}