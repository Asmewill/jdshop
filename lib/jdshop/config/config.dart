

class Config {

  static const domain="https://jdmall.itying.com/";


  //轮播图数据
  static const  bannerData=domain+"api/focus";
  //猜你喜欢
  static const youLike=domain+"api/plist?is_hot=1";
  //热门推荐
  static const hotRecommend=domain+"api/plist?is_best=1";
  //分类（左边）
  static const categoryLeft=domain+"api/pcate";
  //分类（右边）
  static const categoryRight=domain+"api/pcate?pid=";

}