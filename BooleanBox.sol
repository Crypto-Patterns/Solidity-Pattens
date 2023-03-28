pragma solidity ^0.4.26;                       
                         
contract BooleanBox
{
    uint8 myBooleanBox;
  
    function set(uint8 _value) public
    {
        //this function can set all the 8 bits at one time
        //the client must take care of writing the desidered bits into _value
        
        myBooleanBox = _value;
    }

    function get() public view returns (uint8)
    {
        //this function returns all the 8 bits at one time
        //the client must take care of reading the desidered bits
        
        return myBooleanBox;
    }

    function setFlagTrue(uint8 _bit) public
    {
        //this function sets _bit to true (1)
                
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
        
        myBooleanBox |= (1 << _bit);
    }

    function setFlagTrueMask(uint8 _mask) public
    {
        //this function sets the corresponding bits, set to 1 in the _mask, to true (1) 
        
        myBooleanBox |= _mask;
    }
  
    function setFlagFalse(uint8 _bit) public
    {
        //this function sets _bit to false (0)
        
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
	    
        myBooleanBox &= (~(1 << _bit)); 
    }
    
    function setFlagFalseInverted(uint8 _bit) public
    {
        //this function sets _bit to false (0)
        //this function has the same effect of 'setFlagFalse' but trades consistency against performance in order to avoid the ~ operation
        
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
	    
        myBooleanBox &= (1 << _bit); 
    }

    function setFlagFalseMask(uint8 _mask) public
    {
        //this function sets the corresponding bits, set to 1 in the _mask, to false (0) 
	    
        myBooleanBox &= ~_mask; 
    }

    function setFlagFalseMaskInverted(uint8 _mask) public
    {
        //this function sets the corresponding bits, set to 0 in the _mask, to false (0) 
        //this function has the same effect of 'setFalseMask' but trades consistency against performance in order to avoid the ~ operation
	    
        myBooleanBox &= _mask; 
    }

    function toggleFlag(uint8 _bit) public
    {
        //this function toggles _bit from true (1) to false (0) and viceversa
        
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
    	
        myBooleanBox ^= (1 << _bit);
    }

    function getFlag(uint8 _bit) public constant returns (bool)
    {
        //this function reads _bit and returns true if _bit equals 1 or false if _bit equals 0
        
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
        
        return (myBooleanBox & (1 << _bit)==(1 << _bit));
    }
}

contract BooleanBoxes
{
    uint8[32] myBooleanBoxArray;//256 bits
  
    function set(uint8 _index, uint8 _value) public
    {
        //this function can set all the 8 bits of myBooleanBoxArray[_index] at one time
        //the client must take care of writing the desidered bits into _value
        
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
                
        myBooleanBoxArray[_index] = _value;
    }

    function get(uint8 _index) public view returns (uint8)
    {
        //this function returns all the 8 bits of myBooleanBoxArray[_index] at one time
        //the client must take care of reading the desidered bits
    
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
    
        return myBooleanBoxArray[_index];
    }

    function setFlagTrue(uint8 _index, uint8 _bit) public
    {
        //this function sets _bit of myBooleanBoxArray[_index] to true (1)
    
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
        
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
        
        myBooleanBoxArray[_index] |= (1 << _bit);
    }

    function setFlagTrueMask(uint8 _index, uint8 _mask) public
    {
        //this function sets the corresponding bits of myBooleanBoxArray[_index], set to 1 in the _mask, to true (1) 
        
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
        
        myBooleanBoxArray[_index] |= _mask;
    }
  
    function setFlagFalse(uint8 _index, uint8 _bit) public
    {
        //this function sets _bit of myBooleanBoxArray[_index] to false (0)
    
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
        
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
        
	    myBooleanBoxArray[_index] &= (~(1 << _bit)); 
    }
    
    function setFlagFalseInverted(uint8 _index, uint8 _bit) public
    {
        //this function sets _bit of myBooleanBoxArray[_index] to false (0)
        //this function has the same effect of 'setFalse' but trades consistency against performance in order to avoid the ~ operation
        
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
        
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
        
	    myBooleanBoxArray[_index] &= (1 << _bit);
    }

    function setFlagFalseMask(uint8 _index, uint8 _mask) public
    {
        //this function sets the corresponding bits of myBooleanBoxArray[_index], set to 1 in the _mask, to false (0) 
        
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
	    
        myBooleanBoxArray[_index] &= ~_mask; 
    }

    function setFlagFalseMaskInverted(uint8 _index, uint8 _mask) public
    {
        //this function sets the corresponding bits of myBooleanBoxArray[_index], set to 0 in the _mask, to false (0) 
        //this function has the same effect of 'setFalseMask' but trades consistency against performance in order to avoid the ~ operation
        
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
        	    
        myBooleanBoxArray[_index] &= _mask; 
    }

    function toggleFlag(uint8 _index, uint8 _bit) public
    {
        //this function toggles _bit of myBooleanBoxArray[_index] from true (1) to false (0) and viceversa
    
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
        
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value

        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
        
    	myBooleanBoxArray[_index] ^= (1 << _bit);
    }

    function getFlag(uint8 _index, uint8 _bit) public constant returns (bool)
    {
        //this function reads _bit of myBooleanBoxArray[_index] and returns true if _bit equals 1 or false if _bit equals 0
        
        //_bit range: 0..7
        //result of shift has type uint8 and thus might overflow
        //the client must take care of providing a correct value
        //uncomment the line below if a check is needed
        //require(_bit >= 0 && _bit <=7, '_bit out of range');
        
        //_index range: 0..31
        //out of bounds indexes will result in a buffer overflow error
        //the client must take care of providing a correct value
        
        //uncomment the line below if a check is needed
        //require(_index >= 0 && _index <=31, '_index out of range');
        
        return (myBooleanBoxArray[_index] & (1 << _bit)==(1 << _bit));
    }
}
