pragma solidity ^0.7.4;

contract OneTimeEnableEmergency {

    string private _metadataLink;

    constructor(string memory metadataLink) {
        _metadataLink = metadataLink;
    }

    function getMetadataLink() public view returns(string memory) {
        return _metadataLink;
    }

    function callOneTime(address) public {
	IMateriaProxy(<materiaProxyAddress>).setEmergencyMode(true); //optional

	// The new factory should already be deployed
	IMateriaProxy(<materiaProxyAddress>).changeFactory(<newFactoryAddress>, <bridgeToken>, <feeToSetter>);
	
	/* To do: maybe it's better to save the addresses in the state holder?
	   The code would be clearer and even if this would cost GAS, it should be
           executed only one time */
    }

}

interface IMateriaProxy {
    function setEmergencyMode(bool) external;
    function changeFactory(address factory, address bridgeToken, address feeToSetter) public; 
}
