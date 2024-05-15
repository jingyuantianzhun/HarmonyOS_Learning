import Constants from '../constants/Constants'

@Component
export default struct SearchHeader {
  build() {
    Row(){
     Stack(){
       Search().layoutWeight(1)

       Image($r('app.media.ewm')).width(20).margin({right:15})
     }
      .alignContent(Alignment.End)
      .layoutWeight(1)
      Image($r('app.media.microphone')).width(30)
    }.width('90%')
  }
}