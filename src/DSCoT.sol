/*
#------------------------------------------------
#
#   Project created by Usman Khalil 2022-04-18T
#
#-------------------------------------------------
*/
// SPDX-License-Identifier: MIT

pragma solidity >= 0.4.22 < 0.9.0;

import "./nft_Interface.sol";
import "./erc721_Interface.sol";

contract DSCoT is ERC721,nft {

    uint256 count=0; //count for all the tokens

    //Constructor defined for the creater of contract as the first admin
    constructor() {
        admins.push(msg.sender); 
    }

    address [] admins; // admins of the system

    mapping(address => uint256) ownerBalance;               //To know how many tokens an owner has.
    mapping(address => uint256) userBalance;                //To know how many tokens a user can use.

    struct Token{ // struct for the information of a given token
        bytes32 _tokenID;                                     //Token ID will be created.
        uint256 timestamp;                                    //Last time device update its proof of live
    }

    struct Devices{ // struct for the addresses of devices
        address dev;
        address fog;
    }
    Token [] public Tokens ; // List of all the issued tokens
    // mapping for users and their accessable devices
    mapping (address => Devices[]) public users_devices;
    // mapping for devices at a fog node
    mapping (address => address[]) public fog_devices; 

    modifier onlyOwner { // for user check at modifications
        //admins.push(msg.sender);
        //require(msg.sender==admin);
        bool admin=false;
        for(uint256 i = 0; i < admins.length; i++){
            if(msg.sender==admins[i]){
                admin=true;
                break;
            }
        }
        if(!admin)
            revert("Not an Admin");
        else
        _;
    } 
   
    function No_ofAdmins() public onlyOwner virtual override view returns (uint256)  {
        //return address [] admins;
        return admins.length; 
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) public virtual override payable{

    }

    function balanceOf(address _owner) public onlyOwner virtual override view returns (uint256){
        return(ownerBalance[_owner]);
    }
    
    function ownerOf(uint256 _tokenId) public onlyOwner virtual override view returns (address){
        return(admins[_tokenId]);
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory data) public virtual override onlyOwner payable{
        
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId) public onlyOwner virtual override  payable{
        //transferFrom(_from, _to, _tokenId);
    }

    // Gives the contents of the addresses lists in admins
    function adminAdd() public onlyOwner virtual override view returns (address[] memory) {
        return admins;
    }
    // adds a device to a given user by admin
    function addUserDeviceMapping(address user, address device,address fog) 
                                                             public virtual override onlyOwner{ 
        //only admin can add users and devices
        bool deviceExists=false;
        for(uint256 i = 0; i<fog_devices[fog].length; i++){
        // Check if device is added to a fog already otherwise it doesn't exist
        if(fog_devices[fog][i]==device){ // check the devices of a user
            // device is mapped to a fog
               // fog=users_devices[msg.sender][i].fog;
                deviceExists=true;
                break;
            }
        }
        if(deviceExists){
            users_devices[user].push(Devices(device,fog));
            emit UserDeviceMappingAdded(user,device,msg.sender,fog);
        }
        else
            emit DeviceDoesnotExist(device,fog,msg.sender);
    }
    
    // Gives the contents of the addresses of User's devices
    function user_Devices_Add() public onlyOwner view returns (Devices[] memory) {
        //return users_devices[];
    }

    // adds a device to a given fog node
    function addDeviceFogMapping(address fog, address device) public virtual override onlyOwner{ 
        //only admin can add users and devices
        fog_devices[fog].push(device);
        emit FogDeviceMappingAdded(fog,device,msg.sender);
    }   
    
    // Gives the contents of the addresses of fog devices
    //function fog_Devices_Add() public virtual override view returns (Devices[] memory) {
       //return user_devices.Devices[]; 
    //}

    // Gives the contents of the Tokens issued
    function tokens_Issued() public view returns (Token[] memory) {
        return Tokens;
    }
    
    function delAdmin (address admin) public onlyOwner virtual override { 
        if(admins.length<2)
            revert('Admin does not exist');
        else {
            uint256 i = 0;
            while(i < admins.length){
                if(admins[i]== admin){
                    admins[i] = admins[admins.length - 1];
                    admins.pop();   
                    emit AdminDeleted(admin,msg.sender);
                }
                i++;
            }
            
        }
    }
    // delete user access to all devices
    function delUser(address user) public onlyOwner virtual override { 
        delete users_devices[user];
        emit UserDeviceAllMappingDeleted(user,msg.sender);
    }
    // delete devices at a fog node 
    function delDev(address fog) public onlyOwner virtual override { 
        delete fog_devices[fog];
        emit FogDeviceAllMappingDeleted(fog,msg.sender);
    }

    function approve(address _approved, uint256 _tokenId) public onlyOwner virtual override payable{
        // _tokenId = _approved; 
        admins.push() = _approved; _tokenId;
        emit AdminAdded(_approved,msg.sender);

    }

    function setApprovalForAll(address _operator, bool _approved) public onlyOwner virtual override{
        
    }

    function getApproved(uint256 _tokenId) public onlyOwner virtual override view returns (address){
        //return (Tokens._tokenId);
    }

    function isApprovedForAll(address _owner, address _operator) public onlyOwner virtual override view returns (bool){
        
    }

    // authetnication request
    function mintNFT(address device,address fog) public virtual override { 
        // Check if device exists in fog-device mapping
        bool deviceExists=false;
        for(uint256 i = 0; i<fog_devices[fog].length; i++){
            if(fog_devices[fog][i]==device){ // check the devices of a user
                // device is mapped to a fog
                fog=users_devices[msg.sender][i].fog;
                deviceExists=true;
                break;
            }
        }
        if(!deviceExists){
            //trigger DeviceDoesnotExist event
            emit DeviceDoesnotExist(device,fog,msg.sender);
        }
        else{
            bool auth=false;
            for(uint256 j = 0; j<users_devices[msg.sender].length; j++){
                if(users_devices[msg.sender][j].dev==device){ 
                // if we find device we need to find the fog it belongs to
                    auth=true;
                    break;
                }
            }
            if(auth){ // shares successful authentication event
                emit Authenticated(msg.sender, device, fog);
                bytes32 _tokenID= keccak256(abi.encodePacked(device,fog,msg.sender,block.timestamp));
                Tokens.push(Token(_tokenID, block.timestamp));
                emit TokenCreated(_tokenID,msg. sender, device, fog, block.timestamp);
            }
            else if(!auth){
                // trigger failed authentication event
                emit NotAuthenticated(msg.sender);
            }
        }
    }
}
