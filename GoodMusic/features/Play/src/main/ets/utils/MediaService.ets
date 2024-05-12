import common from '@ohos.app.ability.common';
import media from '@ohos.multimedia.media';
import App from '@system.app';
import { AudioPlayerState, MusicPlayMode } from '../viewmodel/MusicData';
import { MusicList } from '../viewmodel/MusicListViewModel';
import { SongItem } from '../viewmodel/SongData';
import { BackgroundUtil } from './BackgroundUtil';
import { Logger } from './Logger';
import { MediaTools } from './MediaTools';
import SongItemBuilder from './SongItemBuilder';
import Song from '../viewmodel/Song';

const TAG = 'MediaService';

export class MediaService {
  private context: common.UIAbilityContext | undefined = AppStorage.Get('context');
  private avPlayer: media.AVPlayer | null = null; // 播放器对象AVPlayer
  private songItemBuilder: SongItemBuilder; // 歌曲播放构建对象
  private songItem: SongItem = new SongItem(); // 歌曲播放模型
  private playMode: MusicPlayMode = MusicPlayMode.ORDER; // 歌曲播放模式，默认为顺序
  private state: AudioPlayerState = AudioPlayerState.IDLE; // 歌曲的播放状态，默认为idle
  private isFirst: boolean = true; // Played歌曲是第一首,默认为true
  private isPrepared: boolean = false; // 歌曲播放状态是prepared,默认为false
  private musicIndex: number = 0; //要播放的音乐的在音乐列表中的位置，默认为0
  private songList: SongItem[] = MusicList; // 播放的歌曲列表，默认为MusicList
  private isCurrent: boolean = true; // 播放的是否是当前歌曲，默认为true



  /**
   * 设置音乐播放列表
   * @param musicList
   */
  public setMusicList(musicList:SongItem[]){
   if(!musicList){
     Logger.error(TAG,'setMusicList Error');
     return;
   }
    this.songList = musicList
  }

  public getSongItem(){

  }

  /**
   * MediaService构造器，初始化歌曲播放资源和音频播放器
   */
  constructor() {
    this.songItemBuilder = new SongItemBuilder() // 初始化播放的音频资源
    this.initAudioPlayer(); //初始化音频播放器
  }
  /**
   * 获取mediaService实例，为音频播放提供支持对象
   * @returns mediaService
   */
  public static getInstance(): MediaService {
    let mediaService: MediaService | undefined = AppStorage.Get('mediaService');
    if (!mediaService) { //如果mediaService实例不存在，则创建并在全局UI存储中保存
      mediaService = new MediaService();
      AppStorage.SetOrCreate('mediaService', mediaService);
    }
    return mediaService;
  }
  /**
   * 初始化音频播放器，为avPlayer绑定setAVPlayerCallback回调
   */
  private initAudioPlayer() {
    // 获取AVPlayer对象
    media.createAVPlayer().then(async (avPlayer: media.AVPlayer) => {
      if (avPlayer !== null) { //如果获取到，就赋值给mediaService的属性avPlayer
        this.avPlayer = avPlayer;
        this.setAVPlayerCallback(); // 为avPlayer绑定setAVPlayerCallBack函数回调
      }
    })
      .catch((error: Error) => Logger.error(TAG, 'this avPlayer:',
        `catch error happened, Error cause : ${JSON.stringify(error)}`));
  }
  /**
   * 定义avPlayer的setAVPlayerCallback回调，即avPlayer的状态机回调
   */
  private setAVPlayerCallback() {
    if (!this.avPlayer || this.avPlayer === null) { //如果avPlayer为空或不存在则返回错误信息，并结束执行
      Logger.error(TAG, `Invoke avPlayer failed`);
      return;
    }
    // seekDone 状态回调，seek完成触发该状态机回调
    this.avPlayer.on('seekDone', (seekDoneTime: number) => {
      this.isCurrent = true; // 当前播放设置为true
      Logger.info(TAG, `AVPlayer seek succeeded, seek time is ${seekDoneTime}`);
    });
    // avPlayer发生错误的状态机回调
    this.avPlayer.on('error', (err) => {
      Logger.error(TAG, `Invoke avPlayer failed, code is ${err.code}, message is ${err.message}`);
      if (this.avPlayer) this.avPlayer.reset(); // 重置avPlayer播放器
    });
    // 播放进度条更新回调
    this.avPlayer.on('timeUpdate', (updateTime: number) => {
      if (this.isCurrent) {
        AppStorage.SetOrCreate('currentTime', MediaTools.msToCountdownTime(updateTime));
        AppStorage.SetOrCreate<number>('progress', updateTime); //保存进度条播放时间
      }
    })
    // avPlayer状态机回调
    this.avPlayer.on('stateChange', async (state: media.AVPlayerState) => {
      let stateString = state.toString(); //获取avPlayer状态，将其转为string格式
      switch (stateString) {
        case 'idle':
          Logger.info(TAG, 'AVPlayer state idle called.');
          this.state = AudioPlayerState.IDLE;
          this.songItem = await this.songItemBuilder.build(this.songList[this.musicIndex]);
          let url = this.songItemBuilder.getRealUrl();
          if (url && this.avPlayer) {
            let avFileDescriptor: media.AVFileDescriptor = { fd: url.fd, offset: url.offset, length: url.length };
            this.avPlayer.fdSrc = avFileDescriptor;
          }
          break;

        case 'initialized':
          Logger.info(TAG, 'AVPlayer state initialized called.');
          this.state = AudioPlayerState.INITIALIZED;
          if (this.avPlayer) {
            this.avPlayer.prepare().then(() => {
              Logger.info(TAG, 'AVPlayer prepare succeeded.');
            }, (err: Error) => {
              Logger.error(TAG, `Invoke prepared failed, Error cause: ${JSON.stringify(err)}`);
            });
          }
          break;
        case 'prepared':
          Logger.info(TAG, 'AVPlayer state prepared called.');
          this.state = AudioPlayerState.PREPARED;
          this.isPrepared = true;
          AppStorage.SetOrCreate('totalTime', MediaTools.msToCountdownTime(this.getDuration()));
          AppStorage.SetOrCreate('progressMax', this.getDuration());
          if (this.avPlayer) this.avPlayer.play();
          Logger.info(TAG, 'AVPlayer prepared succeeded.');
          break;
        case 'playing':
          Logger.info(TAG, 'AVPlayer state playing called.');
          this.state = AudioPlayerState.PLAY;
          break;
        case 'paused':
          Logger.info(TAG, 'AVPlayer state paused called.');
          this.state = AudioPlayerState.PAUSE;
          break;
        case 'completed':
          Logger.info(TAG, 'AVPlayer state completed called.');
          this.state = AudioPlayerState.COMPLETED;
          this.playNextAuto(false);
          break;
        case 'stopped':
          Logger.info(TAG, 'AVPlayer state stopped called.');
          this.state = AudioPlayerState.STOP;
          if (this.avPlayer) this.avPlayer.reset();
          break;
        case 'released':
          Logger.info(TAG, 'AVPlayer state released called.');
          this.state = AudioPlayerState.RELEASED;
          break;
        default:
          Logger.info(TAG, 'AVPlayer state unknown called');
          this.state = AudioPlayerState.UNKNOWN;
          break;
      }
      this.updateIsPlay(this.state === AudioPlayerState.PLAY)
    })
  }
  /**
   * Play music by index.
   * @param musicIndex
   */
  async loadAssent(musicIndex: number) {
    if (musicIndex >= this.songList.length) {
      Logger.error(TAG, `current musicIndex ${musicIndex}`);
      return;
    }
    BackgroundUtil.startContinuousTask(this.context);
    this.updateMusicIndex(musicIndex);

    if (this.isFirst) {
      this.isFirst = false;
      this.songItem = await this.songItemBuilder.build(this.songList[this.musicIndex]);
      let url = this.songItemBuilder.getRealUrl();
      if (url && this.avPlayer) {
        Logger.info(TAG, 'loadAsset avPlayer.url:' + this.avPlayer.fdSrc);
        let avFileDescriptor: media.AVFileDescriptor = { fd: url.fd, offset: url.offset, length: url.length };
        this.avPlayer.fdSrc = avFileDescriptor;
      }
    } else {
      await this.stop();
    }
  }
  /**
   * Get whether the music is played for the first
   * @returns isFirst
   */
  public getFirst() {
    return this.isFirst;
  }
  /**
   * Set music play mode
   * @param playMode
   */
  public setPlayModel(playMode: MusicPlayMode) {
    this.playMode = playMode;
    Logger.info(TAG, 'setPlayModel mode:' + this.playMode);
  }

  public getPlayMode() {
    return this.playMode;
  }

  private updateIsPlay(isPlay: boolean) {
    AppStorage.SetOrCreate<boolean>('isPlay', isPlay);
  }
  /**
   * Seek play music.
   * @param ms
   */
  public seek(ms: number) {
    if (this.isPrepared && this.state != AudioPlayerState.ERROR) {
      let seekMode = this.getCurrentTime() < ms ? 0 : 1;
      let realTime = (ms <= 0 ? 0 : (ms >= this.getDuration() ? this.getDuration() : ms));
      this.isCurrent = false;
      if (this.avPlayer) this.avPlayer.seek(realTime, seekMode);
    }
  }

  private getCurrentTime() {
    if (this.isPrepared && this.avPlayer) {
      return this.avPlayer.currentTime;
    }
    return 0;
  }

  private getDuration() {
    if (this.isPrepared && this.avPlayer) {
      return this.avPlayer.duration;
    }
    return 0;
  }


  private start(seekMs?: number) {
    Logger.info(TAG, 'AVPlayer play() isPrepared:' + this.isPrepared + ', state:' + this.state + ', seek:' + seekMs);
    if (this.avPlayer) {
      this.avPlayer.prepare().then(() => {
      }).catch((error: Error) => {
        if (this.avPlayer) {
          Logger.error(TAG, `start error ${JSON.stringify(error)} avplayer ${this.avPlayer.state}`)
          this.state = AudioPlayerState.ERROR;
          this.updateIsPlay(false);
          this.isPrepared = false;
          let url = this.songItemBuilder.getRealUrl();
          if (url && this.avPlayer) {
            Logger.info(TAG, 'loadAsset avPlayer.url:' + this.avPlayer.fdSrc);
            let avFileDescriptor: media.AVFileDescriptor = { fd: url.fd, offset: url.offset, length: url.length };
            this.avPlayer.fdSrc = avFileDescriptor;
          }
        }
      });
    }
  }

  /*
  Play music
   */
  public async play() {
    Logger.info(TAG, 'AVPlayer play() isPrepared:' + this.isPrepared + ',state' + this.state);
    BackgroundUtil.startContinuousTask(this.context);
    if (!this.isPrepared) {
      this.start(0);
    } else {
      if (this.avPlayer) {
        this.avPlayer.play().then(() => {
          Logger.info(TAG, 'progressTime play() current time:' + this.getCurrentTime());
          this.seek(this.getCurrentTime());
          this.updateIsPlay(true);
          this.state = AudioPlayerState.PLAY;
        })
      }
    }
  }
  /**
   * Pause music
   */
  public pause() {
    Logger.info(TAG, 'AVPlayer pause() isPrepared:' + this.isPrepared + ',state:' + this.state);
    if (this.isPrepared && this.state == AudioPlayerState.PLAY && this.avPlayer) {
      this.avPlayer.pause().then(() => {
        this.state = AudioPlayerState.PAUSE;
        this.updateIsPlay(false);
      })
    }
  }
  /**
   * play next music
   * @param isFromControl
   */
  public playNextAuto(isFromControl: boolean) {
    Logger.info(TAG, 'playNextAuto mode:' + this.playMode);
    switch (this.playMode) {
      case MusicPlayMode.SINGLE_CYCLE:
        if (isFromControl) {
          this.playNext();
        } else {
          if (this.avPlayer) this.avPlayer.play();
        }
        break;
      case MusicPlayMode.ORDER:
        this.playNext();
        break;
      case MusicPlayMode.RANDOM:
        this.playRandom();
        break;
      default:
        break;
    }
  }

  private playNext() {
    Logger.info(TAG, 'playNext Index:' + this.musicIndex + ',length-1:' + (this.songList.length - 1));
    if (this.musicIndex === this.songList.length - 1) {
      this.loadAssent(0);
    } else {
      this.loadAssent(this.musicIndex + 1);
    }
  }
  /**
   * Play previous music.
   */
  public playPrevious() {
    switch (this.playMode) {
      case MusicPlayMode.RANDOM:
        this.playRandom();
        break;
      case MusicPlayMode.ORDER:
      case MusicPlayMode.SINGLE_CYCLE:
        if (this.musicIndex === 0) {
          this.updateMusicIndex(this.songList.length - 1);
        } else {
          this.updateMusicIndex(this.musicIndex - 1);
        }
        Logger.info(TAG, 'setLastIndex:' + this.musicIndex);
        this.loadAssent(this.musicIndex);
        break;
      default:
        break;
    }
  }

  private playRandom() {
    let num = Math.round(Math.random() * (this.songList.length - 1));
    if (this.musicIndex === num) {
      this.playRandom();
    } else {
      this.updateMusicIndex(num);
      this.loadAssent(num);
    }
    Logger.info(TAG, 'play Random:' + this.musicIndex);
  }
  /**
   * Stop music
   */
  public async stop() {
    if (this.isPrepared && this.avPlayer) {
      Logger.info(TAG, 'stop()');
      await this.avPlayer.stop();
      this.updateIsPlay(false);
      this.state = AudioPlayerState.PAUSE;
    }
  }

  private async reset() {
    Logger.info(TAG, 'reset()');
    await this.songItemBuilder.release();
    if (this.avPlayer) {
      await this.avPlayer.reset();
    }
    this.isPrepared = false;
  }
  /**
   * release avPlayer
   */
  public release() {
    this.updateIsPlay(false);
    this.stop();
    this.reset();
    if (this.avPlayer) this.avPlayer.release();
    this.state = AudioPlayerState.IDLE;
    if (this.context) {
      BackgroundUtil.startContinuousTask(this.context);
    }
  }

  private updateMusicIndex(musicIndex: number) {
    Logger.info(TAG, 'updateMusicIndex ===>' + musicIndex);
    AppStorage.SetOrCreate('selectIndex', musicIndex);
    if (this.musicIndex != musicIndex) {
      this.musicIndex = musicIndex;
    }
  }
}

































