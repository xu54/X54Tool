# X54Tool

####Description
 This is a very convenient toolset for every oc developer.It's small but very powerful;
 [中文使用说明链接](http://)
===

####Usage

* Just import `X54Tool.h` in your file which you need.  
* How make your own class chain-style?  
  what's chain-style? <br>
  chain-style class is a convenient way to set properties of a object like this:<br>
          `obj.$x(100).$y(200).$width(300).$height(400)`<br>
      this means `set obj x=100, y=200, width=300, height=400`<br>
  It's cool ha?now you can add this style to your own class with the following steps:<br>
  1)add micro in your interface :    

```objective-c    
  @interface YourClass :NSObject  
  _chain_set_decl(UIView, float, x ); //this add a property named $x in YourClass   
  _chain_set_decl(UIView, float, y ); //this add a property named $y in YourClass
  @end
```   

  2)add micro in your implementation :  
  
```objective-c
  @implementation YourClass :NSObject
  _chain_set_impl(UIView, float, x, self.x ); //means when use yourObj.$x(100),set 100 to self.x
  //if you want to implement more  by your self,you can use as follow block
  _chain_set_impl_begin(UIView, float, y ) //means when use yourObj.$y(100),set 100 to _y;
   _y = _chain_set_param; // _chain_set_param is passed by invoker, (e.g. now is 100 )
  _chain_set_impl_end(UIView, float, y )
  @end
```
  with these 2 steps above-mentioned, YourClass can use as this way: `yourObj.$x(100).$y(200)`   
* Other function:
   all of UIView objects have many methods to set and get x,y,width,height,for example:   

```objective-c
   myView.$x(100).$y(200).$width(300);
   myView.$height(500);
   myView.x = 900;
   myView.width=1000;
```   
  and all UIViewController objects have may methods to prompt alertview or actionSheet,for example:   
```objective-c
   [vc showActionSheetWithTitle:nil buttonTitles:@[@"btn1",@"btn2",@"btn3" buttonHandler:^(NSInteger btnIndex,NSString* btnTitle))
   {
    
   }];
``` 

