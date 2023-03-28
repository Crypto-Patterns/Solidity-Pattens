// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.0;

contract Ownable
{
    address owner;

    modifier onlyOwner()
    {
        require(msg.sender==owner, 'must be owner');
        _;
    }
    constructor() public
    {
        owner = msg.sender;
    }

    function getOwner() public view returns(address)
    {
        return owner;
    }
}

contract StoringAddress is Ownable
{
    address payable contractAddress;

    modifier onlyIfStored()
    {
        require(contractAddress != address(0), 'no stored address'); 
        _;
    }

    function setContractAddress (address payable _address) public onlyOwner
    {
        contractAddress = _address;
    }

    function getContractAddress() public view returns(address)
    {
        return contractAddress;
    }
}

contract TreasuryRegistry is StoringAddress
{
    //proxy contract that stores the address of the TreasurySevice contract
}

contract TreasuryVault is StoringAddress
{
    //vault contract that stores the address of the legit contract (TreasurySevice) which can ask for a withdrawal

    mapping (address => uint256) private _balance;

    modifier onlyTreasurySevice()
    {
        require(msg.sender == contractAddress, 'must be TreasurySevice');
        _;
    }

    event depositEvent
    (
        address _user,
        uint256 _value
    );

    event withdrawalEvent
    (
        address _user,
        uint256 _value
    );

    function deposit(address payable _address) payable external onlyTreasurySevice
    {
        _balance[_address] += msg.value;
        emit depositEvent(_address, msg.value);
    }

    function withdraw(address payable _address, uint256 _amount) external onlyTreasurySevice
    {
        require(_balance[_address] >= _amount, 'insufficient funds');
        
        //_address.transfer(_amount);
        //(bool success, bytes memory response) = _address.call{value: _amount}("");
        
        _balance[_address] -= _amount;

        (bool success, ) = _address.call{value: _amount}("");
        
        require(success, 'transfer failed');

        emit withdrawalEvent(msg.sender, _amount);
     }

    function getTotalBalance() public view returns (uint256)
    {
        return address(this).balance;
    }

    function getBalance(address payable _address) public view returns (uint256)
    {
        return _balance[_address];
    }
}

contract TreasurySevice is StoringAddress
{
    //stores the address of TreasuryVault

    TreasuryVault treasuryVault;

    constructor(address payable _treasuryVaultAddress) public
    {
        //super;
        owner = msg.sender;
        treasuryVault = TreasuryVault(_treasuryVaultAddress);
        setContractAddress(_treasuryVaultAddress);
    }

    /*
    business logic
    */  

    receive() external payable onlyIfStored
    {
        treasuryVault.deposit{value: msg.value}(msg.sender);

        //business logic
    }

    function getBalance() public view returns(uint256)
    {
        return treasuryVault.getBalance(msg.sender);
    }

    function withdraw(uint256 _amount) public onlyIfStored
    {
        treasuryVault.withdraw(msg.sender, _amount);
    }
}



