/* Discussion:
 * //materiadex.com
 */
/* Description:
 * Update Swapper
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
	  address materiaOrchestrator = <materiaOrchestrator>;
	  address newSwapper = <newSwapper>; //e.g. a new swapper
  
	  IMateriaOrchestrator(materiaOrchestrator).setSwapper(newSwapper);
    }
}

interface IMateriaOrchestrator {
    function setSwapper(address newSwapper) external;
}
