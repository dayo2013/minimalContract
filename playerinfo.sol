// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract Player {
    address public Coach;
    address public asstcoach;

    struct PlayerInfo{
        string name;
        uint age;
        bytes32 position;
        uint height;
    }
    uint id;

    constructor(address _Coach){
        Coach = _Coach;
        asstcoach = msg.sender;

    } 
    mapping (uint => PlayerInfo ) _play;
    event AddPlayer(string indexed _name, uint _age, bytes32 _position, uint _height);


    modifier onlyOwner (){
        require(Coach == msg.sender,"only coach can add player");
        _;
    }
    function addNewplayer(string memory _name, bytes32 _position,uint _age,uint _height)external onlyOwner{
        id = id + 1;
        PlayerInfo storage playerinfo = _play[id];
        playerinfo.name = _name;
        playerinfo.position = _position;
        playerinfo.age = _age;
        playerinfo.height = _height;
        emit AddPlayer(_name, _age, _position, _height);

    }
    function replacePlayer(uint _id)external onlyOwner{
        delete _play[_id];
    }
    function updatePlayer(uint _id)external view returns (PlayerInfo memory _playinfo){
        _playinfo = _play[_id];

    } 



    
    

  

}