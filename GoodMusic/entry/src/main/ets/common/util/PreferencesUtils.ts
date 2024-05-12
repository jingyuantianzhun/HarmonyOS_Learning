import dataPreferences from '@ohos.data.preferences';

class PreferencesUtils {
  private prefMap: Map<string, dataPreferences.Preferences> = new Map()

  /**
   * 加载Preference
   * @param context 上下文实例
   * @param name 每个Preferences实例的唯一标识
   */
  async onLoadPreferences(context, name: string) {
    try {
      // 创建Preference实例
      let pre = await dataPreferences.getPreferences(context, name)
      // 将得到的Preference保存到一个map中
      this.prefMap.set(name, pre)
      console.log("test-preference", `创建【preference ${name}】成功`)
    } catch (e) {
      console.log("test-preference", `创建【preference ${name}】失败`, JSON.stringify(e))
    }
  }

  /**
   * 保存缓存数据
   * @param name preference唯一表示
   * @param key 缓存的键名
   * @param value 缓存的键值
   */
  async putPreferences(name: string, key: string, value: dataPreferences.ValueType) {
    const pref = this.prefMap.get(name)
    if (!pref) {
      console.log("test-preferences", `preferences:【${name}】实例不存在`)
      return
    }
    try {
      // 写入数据
      await pref.put(key, value)
      // 刷入磁盘
      await pref.flush()
      console.log("test-preferences", `保存【${key} = ${value}】成功`)
    } catch (e) {
      console.log("test-preferences", `保存【${key} = ${value}】失败`, JSON.stringify(e))
    }
  }

  /**
   * 读取缓存数据
   * @param name preference唯一表示
   * @param key 读取的键名
   * @param defValue 当键名不存在时默认的返回值
   * @returns
   */
  async getPreferences(name: string, key: string, defValue: dataPreferences.ValueType) {
    const pref = this.prefMap.get(name)
    if (!pref) {
      console.log("test-preferences", `preferences:【${name}】实例不存在`)
      return
    }
    try {
      let value = await pref.get(key, defValue)
      console.log("test-preferences", `读取【${key} = ${value}】成功`)
      return value
    } catch (e) {
      console.log("test-preferences", `读取【${key}】失败`, JSON.stringify(e))
    }
  }

  /**
   * 删除指定key的缓存数据
   * @param name preference唯一表示
   * @param key 要删除的键名
   */
  async deletePreferences(name: string, key: string) {
    const pref = this.prefMap.get(name)
    if (!pref) {
      console.log("test-preferences", `preferences:【${name}】实例不存在`)
      return
    }
    try {
      await pref.delete(key)
      console.log("test-preferences", `删除【${key}】成功`)
    } catch (e) {
      console.log("test-preferences", `删除【${key}】失败`, JSON.stringify(e))
    }
  }

  /**
   * 监听缓存变化
   * @param name preference唯一表示
   * @param callback 缓存变化后触发的回调，会通过参数传递当前变化的key
   */
  async onPreferences(name: string, callback) {
    const pref = this.prefMap.get(name)
    if (!pref) {
      console.log("test-preferences", `preferences:【${name}】实例不存在`)
      return
    }
    pref.on("change", callback)
  }
}

export default new PreferencesUtils()