﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#ifndef _CEVENTPACKET_H
#define _CEVENTPACKET_H

#include "../../common/cbasetypes.h"

#include <string>

#include "basic.h"

/************************************************************************
 *																		*
 *  																		*
 *																		*
 ************************************************************************/

class CCharEntity;

class CEventPacket : public CBasicPacket
{
public:
    CEventPacket(CCharEntity* PChar, uint16 EventID, std::vector<std::pair<uint8, uint32>> params, int16 textTable = -1);
};

#endif
