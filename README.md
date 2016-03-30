# MCPopMenuController
A custom popMenu controller


![image](https://github.com/agelessman/MCPopMenuController/raw/master/popDemo.gif)


### 特别说明


*  在使用中可以很灵活的控制，下边的可作为参考
*  1.弹出视图中每一个item的展示是用cell实现的，开发者可自定义cell解决显示各种样式
*  2.在真实开发中，可能要显示的数组不是写死的，可专门也一个数据管理者(viewModel) ，可灵活运用
*  3.在本例中每个cell携带一个item模型作为数据源，可扩展
*  4.每个menuButton 有一个extend字段用来携带任何类型数据，在实际使用中需要根据现实的内容发请求，这个时候需要这个extend字段
*  5.popView 可自定义一些基本参数，可修改源代码灵活修改
*  6.转场动画已经预留出来，可自由添加
*  7.欢迎提出宝贵意见 714080794@qq.com