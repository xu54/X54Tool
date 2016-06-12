//
//  X54Global.h
//  X54Tool
//
//  Created by xu54 on 16/6/12.
//  Copyright © 2016年 xu54. All rights reserved.
//

#ifndef X54Global_h
#define X54Global_h

// -- chain set style －－－－－－－－－
// --these micros are defined for adding chain style to any Class conviently

#define _chain_set_decl(className,valueType,valName)  -( className*(^)(valueType) )$##valName;
#define _chain_set_impl(className,valueType,valName,_targetVal)  -( className*(^)(valueType) )$##valName\
{\
className*(^f1)(float) = ^(float _chain_set_param )\
{\
_targetVal = _chain_set_param;\
return self;\
};\
return f1;\
}


#define _chain_set_impl_begin(className,valueType,valName)  -( className*(^)(valueType) )$##valName\
{\
className*(^f1)(float) = ^(float _chain_set_param )\
{

#define _chain_set_impl_end return self;\
};\
return f1;\
}\

//----------------------------------

#endif /* X54Global_h */
