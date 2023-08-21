// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
import "./playerinfo.sol";

contract PlayerFactory{
    Player []Details;
    function newplayerCreated()external returns (Player newplayer){
        newplayer = new Player(msg.sender);
        Details.push(newplayer);

    }

    


}