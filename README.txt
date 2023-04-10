
———————————————
Decentralized Smart City of Things (DSCoT)
———————————————

  The DSCoT software helps define the attributes for the representation of admin, users, edge, and fog devices which further devises an authentication mechanism. This component authenticates verified users to gain access to respective fog and edge devices to avoid unauthorized access utilizing the extended version of non-fungible tokens (NFTs) for cyber-physical systems in smart cities. The code utilizes smart contracts to develop the identification and authentication mechanism which generates the NFT-based authentication access code to authorize access for the assets in cyber-physical systems for the smart city concept. 

  The software obtains this information from the Owner of the DSCoT SCs who is the only entity that triggers the contracts and can add the Users, fog, and IoT-enabled smart devices while the mapped user with fog, and IoT-enabled smart devices initiates the authentication process to gain access to these devices. The software has been developed in Solidity (v0.5.16) and has been deployed utilizing Remix IDE (v0.23.3), and VS Code.

———————————————
CONTENTS OF THE DISTRIBUTION PACKAGE
———————————————

  Remix IDE is an open-source and browser-based integrated development environment (IDE) for building decentralized applications (dApps) on the public/private blockchain. It has been used to develop, compile and deploy the proposed mechanism via smart contracts as an extended ERC721-IoT standard in DSCoT architecture. It provides a user-friendly interface for developers to write, test, and deploy smart contracts using the Solidity programming language. 

  The Remix IDE also contains a default workspace that loads for the very first time; a new workspace is created while no files are existing in the File Explorer. This workspace contains 3 directories:

1. 'contracts': Holds three default smart contracts with different complexity levels, denoted with a number prefix in the file name.
2. 'scripts': Holds two scripts to deploy a contract.
3. 'tests': Contains one Solidity test file for the 'Ballot' contract & one JS test file for the 'Storage' contract

To add the workspace, the cloned version of Decentralized-Smart-City-of-Things-DSCoT needs to be imported to the file explorer which will update the log for the workspace. The proposed DSCoT SC, ERC721 interface, and NFT interface will be imported as a first step so that these SCs may be compiled and deployed as discussed below. These smart contracts will be updated in the "contracts" folder while the scripts will help to deploy these contracts. 

/src/DSCoT.sol 

  Once the SCs are uploaded, the app can be tested as it has already been deployed on the Goerli testnet at the "0x504c7fab97afb2642bb00fff8520aba0857e3544" address. To run the app, click the DEPLOY & RUN TRANSACTIONS tab in the Remix IDE window, then provide the given address in the "At Address" text box. Click the "At Address" button in the apps bar to run the application after deploying the smart contract. The proposed DSCoT smart contract will load which can be further tested.

/src/erc721_Interface.sol 

  Since non-fungible tokens, or NFTs, are built on the Ethereum Request for Comment ERC-721, which defines a standard interface using wallet applications to work with any NFT on Ethereum platforms. The ERC-721 was defined as an interface in solidity which was further inherited in DSCoT.sol smart contract to provide the proposed functionality of non-fungible tokens (NFTs) in a cyber-physical system for the smart city architecture. 

/src/nft_Interface.sol 

  The proposed DSCoT functions and comments were also defined in the interface which provides the extended version of non-fungible tokens (NFTs), defined in the Ethereum Request for Comment ERC-721. It helped define a standard interface using wallet applications to work with proposed NFT as DSCoT architecture on Ethereum platforms. The nft_interface.sol defines an interface in solidity which was further inherited in DSCoT.sol smart contract to enhance the proposed functionality of the non-fungible tokens (NFTs) in a cyber-physical system for the smart city architecture.
  
/docs/demo
  The  REMIX Documentation file presents the graphical demo of the DSCoT software. For details read the file readme.txt found in the demo folder.
  
/images
	Demonstration files with document geometry data. For details read the file readme.txt found in the demo folder.

		The proposed DSCoT architecture abstract, graphical representation is provided with a brief description in the Abstract. 

———————————————
CREDITS
———————————————

Usman Khalil
19h8340@ubd.edu.bn
2023.05.06
