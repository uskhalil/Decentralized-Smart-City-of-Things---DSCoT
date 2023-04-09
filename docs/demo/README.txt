
	The  REMIX Documentation file presents the graphical demo of the DSCoT software. This readme file presents the coloring map for DSCoT below.  
   
#######################################

# Syntax Coloring Map For DSCoT

####################################### 

# DSCoT (KEYWORD1)
# ERC721 (KEYWORD2)

#######################################

# Functions and Components (KEYWORD3)

#######################################	

admins      KEYWORD3  // admins list 
Token       KEYWORD3  // struct for the information of a given token
Devices     KEYWORD3  // struct for the addresses of devices

No_ofAdmins KEYWORD3  // calls the total number of admin EOAs
ownerOf     KEYWORD3  // calls the ownner of EOAs
adminAdd    KEYWORD3  // adds the admin for managing the Users and Devices
delAdmin    KEYWORD3  // delete the Admin
delUser     KEYWORD3  // delete the User
delDev      KEYWORD3  // delete devices at a fog node 
approve     KEYWORD3

addUserDeviceMapping    KEYWORD3    // adds a device to a given user by admin
addDeviceFogMapping     KEYWORD3    // adds a device to a given fog node
mintNFT                 KEYWORD3    // Requests the authentication token for user to access the devices (fog and IoT devices) using NFT-based EOA.

#######################################

# Events (KEYWORD4)

#######################################	

AdminAdded                      KEYWORD4  // This emits when a new admin is added by the current admin. 
AdminAlreadyExists              KEYWORD4  // This emits when an admin address already exists in the list on adding again by the current admin.
DeviceDoesnotExist              KEYWORD4  // This emits when the current admin adds a new device that does not exists on system.
AdminDeleted                    KEYWORD4  // This emits when the current admin removes a new admin.
UserDeviceAllMappingDeleted     KEYWORD4  // This emits when the current admin removes the mapped devices for a user.
FogDeviceAllMappingDeleted      KEYWORD4  // This emits when the current admin removes the mapped fog devices.

UserDeviceMappingAdded          KEYWORD4  // This emits when a new user maps (assigned) to fog device and a Smart Device by the current admin.
FogDeviceMappingAdded           KEYWORD4  // This emits when a new fog device maps (assigned) to a Smart Device by the current admin.
Authenticated                   KEYWORD4  // Authentication events will trigger NFT minting by a user for device Authentication.
NotAuthenticated                KEYWORD4  // This emits when user of any NFT verify and do not verify a device.
TokenCreated                    KEYWORD4  // This emits when Token is created for the verified user to access the mapped devices.
     
