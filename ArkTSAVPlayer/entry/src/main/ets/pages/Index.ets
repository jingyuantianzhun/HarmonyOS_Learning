import { AVPlayerDemo } from './AVPlayerDemo'
import { AVPlayerDemo1 } from './AVPlayerDemo1';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  private surfaceId: string = "";
  xcomponentController:XComponentController = new XComponentController();

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('播放音频')
          .onClick(()=>{
            let av =  new AVPlayerDemo();
            av.avPlayerFdSrcDemo()
          })
        Button('播放视频')
          .onClick(()=>{
            let avPlayerdemo1 = new AVPlayerDemo1();
            avPlayerdemo1.surfaceID = this.surfaceId;
            avPlayerdemo1.avPlayerFdSrcDemo();
          })

        XComponent({
          id: "xcomponent",
          type: "surface",
          controller: this.xcomponentController
        })
          .onLoad(()=>{
            this.xcomponentController.setXComponentSurfaceSize({surfaceWidth:1920,surfaceHeight:1080});
            this.surfaceId = this.xcomponentController.getXComponentSurfaceId();
          })
          .width('100%')
          .height(300)
      }
      .width('100%')
    }
    .height('100%')
  }
}