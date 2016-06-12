# X54Tool

####说明
 这是我写的一个很小巧的功能类库，为oc开发人员提供了一些非常便捷的功能;   
 [click here to nevigate english version](https://github.com/xu54/X54Tool/blob/master/README.md)
 
===

####使用方法

* 把xu54目录拷到你的项目中，然后在任何需要使用的文件前import `X54Tool.h` 就可以了.  
* 如何快速的让你的类拥有链式调用?  
  什么是链式调用? <br>
  链式调用是为对象的属性进行赋值的一种非常便利且酷炫的方法，例如:<br>
          `obj.$x(100).$y(200).$width(300).$height(400)`<br>
      上述代码相当于 `set obj x=100, y=200, width=300, height=400`<br>
  你可以通过简单的两步，让任何类立刻实现这个功能:<br>
  1)在类的头文件添加宏 `_chain_set_decl` :    

```objective-c    
  @interface YourClass :NSObject  
  _chain_set_decl(UIView, float, x ); //为你的类添加了一个属性$x, x的名称自己定义  
  _chain_set_decl(UIView, float, y ); //为你的类添加了一个属性$y,(注意，用的时候需要在y前加$符号
  @end
```   

  2)在.m文件中添加宏_chain_set_impl :  
  
```objective-c
  @implementation YourClass :NSObject
  _chain_set_impl(UIView, float, x, self.x ); //意味着当调用yourObj.$x(100)时候，把 100 赋值给 self.x
  //如果你不是简简单单把值付给self.x，你希望自己做更多的逻辑，可以使用下面的两句宏，然后在中间加自己代码
  _chain_set_impl_begin(UIView, float, y ) 
   _y = _chain_set_param; // _chain_set_param 是用户传进来的值，yourObj.$y(200), _chain_set_param就是200
  _chain_set_impl_end(UIView, float, y )
  @end
```
  通过简单的两句话, YourClass 这个类就可以这样使用了: `yourObj.$x(100).$y(200)`   
* 其他功能:
   所有的UIView类都自动扩展了，增加了对x,y,width,height的链式调用，例如:   

```objective-c
   myView.$x(100).$y(200).$width(300);
   myView.$height(500);
   myView.x = 900;
   myView.width=1000;
```   
  避免了对frame操作的种种不便。
  同时所有UIViewController对象也提供了便捷弹出警告框或选项框的方法，里面还有一句话调出选相机或相簿的对话框，具体可看X54UITool.h的头文件，可以通过X54Tool设置弹出框的字体颜色和大小:   
```objective-c
   [vc showActionSheetWithTitle:nil buttonTitles:@[@"btn1",@"btn2",@"btn3" buttonHandler:^(NSInteger btnIndex,NSString* btnTitle))
   {
    
   }];
``` 




