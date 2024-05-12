

import { PlayControlModel } from './PlayControlModel';
import { ControlConstants } from '../constants/ControlConstants';

const playImage: PlayControlModel[] = [
  new PlayControlModel($r('app.media.ic_download'), ''),
  new PlayControlModel($r('app.media.ic_review'), 'review'),
  new PlayControlModel($r('app.media.ic_mv'), '' ),
  new PlayControlModel($r('app.media.ic_ring'), ''),
  new PlayControlModel($r('app.media.ic_list_more'), '')
]

const playControl: PlayControlModel[] = [
  new PlayControlModel(
    $r('app.media.ic_list_cycle'),
    ControlConstants.PLAY_MODE
  ),
  new PlayControlModel(
    $r('app.media.ic_last'),
    ControlConstants.PREVIOUS
  ),
  new PlayControlModel(
    $r('app.media.ic_play_big'),
    ControlConstants.PLAY
  ),
  new PlayControlModel(
    $r('app.media.ic_next'),
    ControlConstants.NEXT
  ),
  new PlayControlModel(
    $r('app.media.ic_music_list'),
    ControlConstants.PLAY_LIST
  )
]

export { playImage, playControl }