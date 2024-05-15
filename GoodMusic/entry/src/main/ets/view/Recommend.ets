import MySings from '../components/MySings'
import NewSing from '../components/NewSings'
import PersonalRecommend from '../components/PersonalRecommend'
import Rank from '../components/Rank'
import RecommendSings from '../components/RecommendSings'
import SearchHeader from '../components/SerachHeader'
import Constants, { SPACE } from '../constants/Constants'

@Component
export default struct Recommend {
  build() {
    Column(){
      //1.顶部搜索
      SearchHeader()
      List(){
        ListItem(){
          Column({space:SPACE.SPACE_8}){
            //2.个性化推荐
            PersonalRecommend()
            //3.推荐歌单
            RecommendSings()
            //4.新碟上架
            NewSing()
            //5.我的歌单
            MySings()
            //6.排行榜
            Rank().height(Constants.SIZE_220)

          }

        }.padding({left:SPACE.SPACE_8})
      }
    }.height(Constants.FULL_HEIGHT)


  }
}