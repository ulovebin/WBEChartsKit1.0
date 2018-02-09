# WBEChartsKit1.0
最近一直在研究iOS与web交互的一些东西，自己就利用百度的h5图表库ECharts封装了一套iOS的库，无需关注h5的实现通过iOS的代码就能构建各种图表（饼状图、柱状图、折线图、仪表盘、雷达图），来让我们先一起看下效果。
![WBViewDrag.gif](http://upload-images.jianshu.io/upload_images/1728983-30b95313dcbc2eaa.gif?imageMogr2/auto-orient/strip)

   一开始写的时候使用的是iOS的UIWebView来进行加载的，考虑到性能问题最终使用了苹果新框架，用WKWebView来进行了替换，不得不说WKWebView的性能比UIWebView高了很多，但WKWebView只支持8.0以上iOS版本。

在封装的过程中小菜鸟尽量让这些图表的创建接口统一化，这样使用起来就方便了很多，下面就以柱状图为例进行下创建演示吧！

1、首先导入必要的库文件

![库文件.png](http://upload-images.jianshu.io/upload_images/1728983-9991400bd7ff8541.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2、创建饼状图代码

![创建饼状图.png](http://upload-images.jianshu.io/upload_images/1728983-7a2ff97741c843a0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![柱状图.png](http://upload-images.jianshu.io/upload_images/1728983-123a1192af360bad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3、上面是个完整创建饼状图的代码其中涉及到很多的设置变量的注释小菜鸟已经写得很清楚了，使用时按照需求设置就可以了，点击变量跳转可以看到。

![设置变量.png](http://upload-images.jianshu.io/upload_images/1728983-8140ba68a13f76db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4、WBEEChartsKit可以设置十三种主题，已经暴露接口可以通过iOS代码很容易的使用，另外图表的截屏也已经暴露了接口，小伙伴们可以通过文章结尾的Demo进行更深入的了解，里面有各种图表的用法实例。

WBEEChartsKit是我发布的第一个版本，很多的功能还不是很健全，但还是能满足一般用户对图表使用的基本需求的，小伙伴们如果有什么好一点的想法也可以在文章末尾进行留言，小菜鸟之后会进行采纳更新的。

最后，[WBEEChartsKit下载地址](https://github.com/ulovebin/WBEChartsKit1.0)。小伙伴们如果喜欢的话记得在github上帮小菜鸟star一下，O(∩_∩)O哈哈~
