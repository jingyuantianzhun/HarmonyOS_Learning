
// 创建新实例
let storageP = new LocalStorage({ 'SwitchColor': Color.White ,'angle':0,'PlayedDuration':0,
    'SwitchPlay':$r('app.media.pause')});

@Entry(storageP)
@Component
export default struct Play {
  @State SongTitle:string='飞云之下'
  @State PlayTime:number=20
  @LocalStorageLink('PlayedDuration') PlayedDuration: number = 0;
  // @State freshColor:number=1
  TimeoutPC:number=-1

  @LocalStorageLink('SwitchPlay') SwitchPlay:Resource=$r('app.media.pause')
  // SwitchPlay:string='pause'
  // SwitchColor:ResourceColor=Color.White
  @LocalStorageLink('SwitchColor') SwitchColor: ResourceColor = Color.White;

  //旋转
  @LocalStorageLink('angle') angle: number = 0;
  intervalPM:number=-1

  build() {
      Row({ space: 15 }) {
        Stack() {
          Image($r('app.media.chassis'))
            .width(70)
            .borderRadius(100)
          Image($r('app.media.startIcon'))
            .width(40)
            .borderRadius(100)
            .rotate({
              //旋转轴
              x: 0,
              y: 0,
              z: 1,
              //旋转中心
              centerX: '50%',
              centerY: '50%',
              //旋转角度
              angle:this.angle
            })
            .animation({
              duration: 1000,
              curve: Curve.EaseOut,
              iterations: 1,
              playMode: PlayMode.Normal
            })
        }
        .margin({ left: 15 })

        Text(this.SongTitle)
          .fontSize(20)
          .margin({ right: 40 })

        Stack() {
          Progress({ value: this.PlayedDuration, total: this.PlayTime, type: ProgressType.Ring })
            .width(35)
            .color(Color.Black)

          // Image($rawfile((this.SwitchPlay+'.svg').toString()))
            Image(this.SwitchPlay)
            .width(35)
            .fillColor(Color.Black)

        }
        // .opacity(this.freshColor)
        .height(60)
        .width(60)
        .borderRadius(15)
        .backgroundColor(this.SwitchColor)
        .onClick(()=>{
          if(this.PlayedDuration==this.PlayTime){
            this.PlayedDuration=0
          }
          // if(this.SwitchPlay=='start'){
          //   this.SwitchPlay='pause'
          //   this.SwitchColor=Color.Grey
          // }else{
          //   this.SwitchPlay='start'
          //   this.SwitchColor=Color.White
          // }
          if(JSON.stringify(this.SwitchPlay)==JSON.stringify($r("app.media.start_1"))){
            this.SwitchPlay=$r('app.media.pause')
            // this.SwitchColor=Color.Grey
          }else{
            this.SwitchPlay=$r("app.media.start_1")
            // this.SwitchColor=Color.White
          }
          this.SwitchColor=Color.Grey
          this.TimeoutPC = setTimeout(function() {
            let SwitchC = storageP.link('SwitchColor')
            SwitchC.set(Color.White)
          }, 1000);
          // this.freshColor++

          //播放功能
          clearInterval(this.intervalPM)
          if(JSON.stringify(this.SwitchPlay)==JSON.stringify($r("app.media.start_1"))){
            this.intervalPM = setInterval(function () {
              let SwitchPlay=storageP.link('SwitchPlay')
              if(JSON.stringify(SwitchPlay.get())!=JSON.stringify($r('app.media.pause'))) {
                let angle = storageP.link('angle')
                // if(angle.get()==360){
                //   angle.set(20)
                // }else{
                //   angle.set(angle.get() as number+20)
                // }
                angle.set(angle.get() as number + 20)
              }
              let PlayedDuration = storageP.link('PlayedDuration')
              if(PlayedDuration.get()<20){
                PlayedDuration.set(PlayedDuration.get() as number+0.5)
              }else{
                SwitchPlay.set($r('app.media.pause'))
              }
            }, 500);
          }else{
            clearInterval(this.intervalPM)
          }

        })
        // .onAppear(()=>{
        //   let timeoutID = setTimeout(function() {
        //     this.SwitchColor=Color.White
        //   }, 1000);
        //   // clearTimeout(timeoutID);
        // })
        .animation({
          duration: 1000,
          curve: Curve.EaseOut,
          iterations: 1,
          playMode: PlayMode.Normal
        })

        Image($r('app.media.PlayMenu'))
          .width(35)
          .fillColor(Color.Black)

      }
      .height(80)
      .width('100%')
      .backgroundColor(Color.White)
  }
}