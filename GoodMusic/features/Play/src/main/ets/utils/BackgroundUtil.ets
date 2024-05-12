
import common from '@ohos.app.ability.common';
import wantAgent from '@ohos.app.ability.wantAgent';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';
import { Logger } from './Logger';
export class BackgroundUtil{
/**
 * 开启后台任务
 * @param context
 */
  public static startContinuousTask(context?:common.UIAbilityContext):void{
    if(!context){
      Logger.error('this avPlayer:',`context undefined`);
      return;
    }
    let wantAgentInfo:wantAgent.WantAgentInfo = {
        wants:[
          {
            bundleName:context.abilityInfo.bundleName,
            abilityName:context.abilityInfo.name
          }
        ],
      operationType:wantAgent.OperationType.START_ABILITY,
      requestCode:0,
      wantAgentFlags:[wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
    };
    
    wantAgent.getWantAgent(wantAgentInfo).then((wantAgentObj:Object)=>{
      try {
        backgroundTaskManager.startBackgroundRunning(context,
        backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK,wantAgentObj).then(()=>{
          Logger.info('this avPlayer:', 'startBackgroundRunning succeeded');
        }).catch((err:Error)=>{
          Logger.error('this avPlayer:', `startBackgroundRunning failed Cause: ${JSON.stringify(err)}`);
        });
      } catch (error){
        Logger.error('this avPlayer:', `startBackgroundRunning failed. Error cause : ${JSON.stringify(error)}`);
      }
    });
  }

  /**
   * 停止后台任务
   * @param context
   */
  public static stopContinuousTask(context:common.UIAbilityContext):void{
    try {
      backgroundTaskManager.stopBackgroundRunning(context).then(() => {
        Logger.info('this avPlayer:', 'stopBackgroundRunning succeeded');
      }).catch((error:Error)=>{
        Logger.error('this avPlayer:', `stopBackgroundRunning failed Cause: ${JSON.stringify(error)}`);
      });
    } catch (error){
      Logger.error('this avPlayer:', `stopBackroundRunning failed. Error Cause:${JSON.stringify(error)}`);
    }
  }
}



































