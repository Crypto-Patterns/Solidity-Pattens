// SPDX-License-Identifier: GPL-3.0

//pragma solidity ^0.4.23;
pragma solidity ^0.8.0;

/**
* @title BooleanBox8
* @dev Uses a 8 bits word as Boolean flags.
*/

library BooleanBox8
{
    /// @dev Sets _bit to true (1).
    /// @param myBooleanBox The original uint8 data.
    /// @param _bit The bit that will be affected.
    function setFlagTrue(uint8 myBooleanBox, uint8 _bit) internal pure returns(uint8)
    {
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
        
        return myBooleanBox |= uint8((1 << _bit));
    }

    /// @dev Sets the corresponding bits, set to 1 in the _mask, to true (1).
    /// @param myBooleanBox The original uint8 data.
    /// @param _mask The mask that will affect myBooleanBox.
    function setFlagTrueMask(uint8 myBooleanBox, uint8 _mask) internal pure returns(uint8)
    {
        return myBooleanBox |= _mask;
    }
  
    /// @dev Sets _bit to false (0).
    /// @param myBooleanBox The original uint8 data.
    /// @param _bit The bit that will be affected.
    function setFlagFalse(uint8 myBooleanBox, uint8 _bit) internal pure returns(uint8)
    {
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
	    
        return myBooleanBox &= (~uint8(1 << _bit)); 
    }

    /// @dev Sets the corresponding bits, set to 1 in the _mask, to false (0).
    /// @param myBooleanBox The original uint8 data.
    /// @param _mask The mask that will affect myBooleanBox.
    function setFlagFalseMask(uint8 myBooleanBox, uint8 _mask) internal pure returns(uint8)
    {
        return myBooleanBox &= ~_mask; 
    }

    /// @dev Toggles _bit from true (1) to false (0) and viceversa.
    /// @param myBooleanBox The original uint8 data.
    /// @param _bit The bit that will be affected.
    function toggleFlag(uint8 myBooleanBox, uint8 _bit) internal pure returns(uint8)
    {
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
    	
        return myBooleanBox ^= uint8((1 << _bit));
    }

    /// @dev Reads _bit and returns true if _bit equals 1 or false if _bit equals 0.
    /// @param myBooleanBox The original uint8 data.
    /// @param _bit The bit that will be affected.
    function getFlag(uint8 myBooleanBox, uint8 _bit) internal pure returns (bool)
    {        
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');        

        return ((myBooleanBox & (1 << _bit)) == (1 << _bit));
    }
}