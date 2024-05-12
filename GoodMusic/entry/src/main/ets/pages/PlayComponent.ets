
import {playControl,MediaService} from 'play'
import router from '@ohos.router'
import Constants from '../constants/Constants'
import Song from '../viewmodel/SongItem'
import {PlayPage1} from '../components/PlayPage1'

@Entry
@Component
struct PlayComponent {
  @StorageLink('mediaService') mediaService:MediaService | undefined = AppStorage.Get('mediaService');
  musicList:Song[] = router.getParams()['musicList'];
  @State index:number = router.getParams()['index'];

  aboutToAppear(){
    // MediaService.getInstance()
    if(this.mediaService){
      this.mediaService.setMusicList(this.musicList)
      AppStorage.SetOrCreate("musicList",this.musicList)
    }
  }
  build() {
    Column(){
      PlayPage1({ playControl: playControl[0] })
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)

  }
}