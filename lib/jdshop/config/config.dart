

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
  //注册
  static const doRegister=domain+"api/register";
  //登录
  static const doLogin=domain+"api/doLogin";
  //增加地址
  static const doAddAddress=domain+"api/addAddress";
  //查询默认地址
  static const doDefaultAddress=domain+"api/oneAddressList?uid=";
  //修改默认地址
  static const doChangeDefaultAddress=domain+"api/changeDefaultAddress";
  //编辑地址
  static const doEditAddress=domain+"api/editAddress";




}