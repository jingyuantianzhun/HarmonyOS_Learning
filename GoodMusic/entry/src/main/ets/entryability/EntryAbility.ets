import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { MediaService } from 'play';
import PreferenceUtils from '../common/util/PreferencesUtils'

export default class EntryAbility extends UIAbility {
  async onCreate(want, launchParam) {
    //获取context
    AppStorage.SetOrCreate('context', this.context);
    MediaService.getInstance()
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

    //主题色可持续化存储
    await PreferenceUtils.onLoadPreferences(this.context,"textColorPreference")
    await PreferenceUtils.onLoadPreferences(this.context,"imageColorPreference")
    await PreferenceUtils.onLoadPreferences(this.context,"big_containerPreference")
    await PreferenceUtils.onLoadPreferences(this.context,"styleBlackColorPreference")
/*    await PreferenceUtils.onLoadPreferences(this.context,"isOnPreference")*/

  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/HomePage', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
