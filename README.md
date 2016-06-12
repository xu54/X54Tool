# X54Tool

####Description
 This is a very convenient toolset for every oc developer.It's small but very powerful;
 
===

####Usage

  * Just import `X54Tool.h` in your file which you need.  
  * How make your own class chain-style?  
     what's chain-style? <br>
      chain-style class is a convenient way to set properties of a object like this:<br>
          obj.$x(100).$y(200).$width(300).$height(400)<br>
      this means set obj x=100, y=200, width=300, height=400<br>
      It's cool ha?now you can add this style to your own class with the following steps:<br>
        1)add micro in your interface :    

```objective-c    
@interface YourClass :NSObject  
_chain_set_decl(UIView, float, x ) //this add a property named $x in YourClass
_chain_set_decl(UIView, float, y ) //this add a property named $y in YourClass
@end
```
         2)add micro in your implementation :   
```objective-c
@implementation YourClass :NSObject
_chain_set_impl(UIView, float, x, self.x ) //means when use yourObj.$x(100),set 100 to self.x
_chain_set_impl(UIView, float, x, _y ) //means when use yourObj.$y(100),set 100 to _y
@end
```
        with these 2 steps above-mentioned, YourClass can use as this way: `yourObj.$x(100).$y(200)`
