//
//  identity.hpp
//  Find Spy
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015 Jason Shen. All rights reserved.
//

#ifndef identity_hpp
#define identity_hpp

#include <stdio.h>
#include <iostream>
#include <string>

class Identity{

private:
    std::string m_normal;
    std::string m_spy;
    
public:
    Identity();
    
    std::string getNormal();
    std::string getSpy();
    
    
};









#endif /* identity_hpp */
