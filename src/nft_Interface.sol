/*
#------------------------------------------------
#
#   Project created by Usman Khalil 2022-04-18T
#
#-------------------------------------------------
*/
// SPDX-License-Identifier: MIT

pragma solidity >= 0.4.22 < 0.9.0;

/// @title sNFT Interface : ERC-721 Non-Fungible Token Standard based
interface nft{
        
    /// @dev This emits when a new admin is added by the current admin. 
    ///  This event emits to share the addition of new admin
    event AdminAdded(address indexed newAdmin, address indexed addingAdmin); 
    
    /// @dev This emits when an admin address already exists in the list on adding again by the current admin.
    ///  This event emits to inform that the admin address already exists 
    event AdminAlreadyExists(address indexed newAdmin, address indexed sender);

    /// @dev This emits when a new user maps (assigned) to fog device and a Smart Device by the current admin.
    ///  This event emits to share new mapping for user-device mapping addition
    event UserDeviceMappingAdded(address indexed user, address indexed device, address addingAdmin, address indexed fog);

    /// @dev This emits when a new fog device maps (assigned) to a Smart Device by the current admin.
    ///  This event emits to share new fog-device mapping addition
    event FogDeviceMappingAdded(address indexed fog, address indexed device, address indexed addingAdmin);

    /// @dev This emits when the current admin adds a new device that does not exists on system.
    ///  This event emits to share the requested device does not exist on the system
    event DeviceDoesnotExist(address indexed device, address indexed fog, address indexed sender);
    
    /// @dev This emits when the current admin removes a new admin.
    ///  This event emits to share the deletion of an new admin
    event AdminDeleted(address indexed newAdmin, address indexed deletingAdmin); 

    /// @dev This emits when the current admin removes the mapped devices for a user.
    ///  This event emits to share the deletion of all user-device mapping of a user added 
    event UserDeviceAllMappingDeleted(address indexed user,  address indexed deletingAdmin);

    /// @dev This emits when the current admin removes the mapped fog devices.
    ///  This event emits to share the deletion all fog-device mapping of a fog
    event FogDeviceAllMappingDeleted(address indexed fog, address indexed deletingAdmin);

    /// Authentication events will trigger NFT minting by a user for device Authentication.
    /// @dev This emits when user of any NFT verify and do not verify a device.
    ///  This event emits when the user a device finishing the assignment.
    event Authenticated(address indexed user, address indexed device, address indexed fog); 
    event NotAuthenticated(address indexed user);
    event TokenCreated(bytes32 indexed _tokenID, address indexed user, address device, address indexed fog, uint256 timestamp);

    //TODO:Describe new functions and events

    /// @notice This function calls the total number of admin address
    function No_ofAdmins() external view returns (uint256); 
    
    /// @notice This function adds the admin for managing the Users and Devices
    /// @dev Only the admin of the token account can add an admin.
    function adminAdd() external view returns (address[] memory); 

    // adds a device to a given user by admin
    function addUserDeviceMapping(address user, address device,address fog) external; 

    //function user_Devices_Add() external view returns (Devices[] memory); 

    // adds a device to a given fog node
    function addDeviceFogMapping(address fog, address device) external;

    //function fog_Devices_Add() external view returns (address[] memory); 

    // Gives the contents of the Tokens issued
    //function tokens_Issued() external view returns (Token[] memory); 
    
    // delete the Admin
    function delAdmin (address admin) external; 

    // delete the User
    function delUser(address user) external; 

    // delete devices at a fog node 
    function delDev(address fog) external;  

    // @notice This is NFT mint function for requesting the authentication token for user to access the devices (fog and IoT devices) using EOA. 
    // @dev Everybody can call this function, can be execute any code on blockchain only read.
    // @param device and fog to obtain device addresses. 
    // @return authenticatoin if meets the criteria for tokenID of the token generated binded to device and fog.
    function mintNFT(address device, address fog) external; 
    
}
