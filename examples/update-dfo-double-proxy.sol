/* Discussion:
 * //materiadex.com
 */
/* Description:
 * Update DFO double proxy
 */
pragma solidity ^0.8.1;

contract MyContract {
    string private _metadataLink;

    constructor(string memory metadataLink) {
        _metadataLink = metadataLink;
    }

    function getMetadataLink() public view returns (string memory) {
        return _metadataLink;
    }

    function callOneTime(address) public {
	IMVDProxy dfoProxy = IMVDProxy(msg.sender);
	address newDoubleProxy = <newDoubleProxy>;
	
	materiaOrchestrator.setDobuleProxy(newDoubleProxy);
	
	dfoProxy.setDoubleProxy(newDoubleProxy);
	
	// May be convenient to check if the contracts now know the new double proxy
	require(materiaOrchestrator.doubleProxy() == dfoProxy.doubleProxy(), "Wrong doubleProxy");
    }
}

interface IMVDProxy {
    function setDoubleProxy(address newDoubleProxy) external;
    function doubleProxy() external returns(address);
}

interface IMateriaOrhcestrator {
    function setDoubleProxy(address newDOubleProxy) external;
}
