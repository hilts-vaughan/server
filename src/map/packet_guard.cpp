﻿#include "packet_guard.h"

// #define PACKETGUARD_CAP_ENABLED 1

#include <unordered_map> // Lookup

#ifdef PACKETGUARD_CAP_ENABLED
#include <unordered_set> // Capture
#endif

namespace PacketGuard
{
#ifdef PACKETGUARD_CAP_ENABLED
    std::unordered_map<CHAR_SUBSTATE, std::unordered_set<uint16>> regular_client_packets;
#endif

    std::unordered_map<CHAR_SUBSTATE, std::unordered_map<uint16, bool>> allowList;
    std::unordered_map<uint16, uint32>                                  ratelimitList; // Default will be 0 - No Limit

    void Init()
    {
        // Allow all non-substate packets
        for (uint16 i = 0; i < 512; ++i)
        {
            allowList[SUBSTATE_NONE][i] = true;
        }

        // In Cutscene
        allowList[SUBSTATE_IN_CS][0x00A] = true; // Log In To Zone
        allowList[SUBSTATE_IN_CS][0x00C] = true; // Event Update (String Update)
        allowList[SUBSTATE_IN_CS][0x00D] = true; // Player Leaving Zone(Dezone)
        allowList[SUBSTATE_IN_CS][0x00F] = true; // Player Information Request
        allowList[SUBSTATE_IN_CS][0x011] = true; // Player Zone Transition Confirmation
        allowList[SUBSTATE_IN_CS][0x015] = true; // Player Sync
        allowList[SUBSTATE_IN_CS][0x016] = true; // Entity Information Request
        allowList[SUBSTATE_IN_CS][0x01A] = true; // Player Action
        allowList[SUBSTATE_IN_CS][0x03A] = true; // Sort Inventory
        allowList[SUBSTATE_IN_CS][0x053] = true; // LockStyleSet
        allowList[SUBSTATE_IN_CS][0x05A] = true; // Map Update (Conquest, Besieged, Campaign)
        allowList[SUBSTATE_IN_CS][0x05B] = true; // Event Update (Completion or Update)
        allowList[SUBSTATE_IN_CS][0x05C] = true; // Event Update (Update Player Position)
        allowList[SUBSTATE_IN_CS][0x060] = true; // Event Update (String Update)
        allowList[SUBSTATE_IN_CS][0x061] = true; // Full Char Update
        allowList[SUBSTATE_IN_CS][0x0B5] = true; // Chat Message
        allowList[SUBSTATE_IN_CS][0x0B6] = true; // Tell Message
        allowList[SUBSTATE_IN_CS][0x0DB] = true; // Set Preferred Language
        allowList[SUBSTATE_IN_CS][0x0E0] = true; // Set Search Message
        allowList[SUBSTATE_IN_CS][0x0F2] = true; // Update Player Zone Boundary
        allowList[SUBSTATE_IN_CS][0x112] = true; // Roe Quest Log Request
        allowList[SUBSTATE_IN_CS][0x114] = true; // Map Marker Request
        allowList[SUBSTATE_IN_CS][0x118] = true; // Not Impl
        allowList[SUBSTATE_IN_CS][0x11B] = true; // Not Impl

        // Rate limiting
        ratelimitList[0x05D] = 2; // Emotes
        ratelimitList[0x11B] = 2; // Set Job Master Display
        ratelimitList[0x11D] = 2; // Jump
    }

    bool PacketIsValidForPlayerState(CCharEntity* PChar, uint16 SmallPD_Type)
    {
        TracyZoneScoped;
#if PACKETGUARD_CAP_ENABLED == 1
        regular_client_packets[PChar->m_Substate].insert(SmallPD_Type);
        for (uint8 state = SUBSTATE_IN_CS; state < SUBSTATE_LAST; ++state)
        {
            fmt::print("Substate {}: ", state);
            for (auto& entry : regular_client_packets[(CHAR_SUBSTATE)state])
            {
                fmt::print("{:#04x}, ", entry);
            }
            fmt::print("\n");
        }
        return true;
#endif

        return allowList[PChar->m_Substate][SmallPD_Type];
    }

    bool IsRateLimitedPacket(CCharEntity* PChar, uint16 SmallPD_Type)
    {
        TracyZoneScoped;
        using namespace std::chrono;
        uint32 lastPacketRecievedTime = PChar->m_PacketRecievedTimestamps[SmallPD_Type];
        uint32 timeNowSeconds         = static_cast<uint32>(time_point_cast<seconds>(server_clock::now()).time_since_epoch().count());
        uint32 ratelimitTime          = ratelimitList[SmallPD_Type];

        PChar->m_PacketRecievedTimestamps[SmallPD_Type] = timeNowSeconds;

        if (lastPacketRecievedTime == 0 || ratelimitTime == 0)
        {
            return false;
        }

        return timeNowSeconds - lastPacketRecievedTime < ratelimitList[SmallPD_Type];
    }

} // namespace PacketGuard
