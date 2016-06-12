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
        1)add micro in your interface ,for example:<br>
          ```cpp
         @interface YourClass :NSObject
         _chain_set_decl(UIView, float, x )
         @end
         ```
