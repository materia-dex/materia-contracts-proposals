/* Discussion:
 * //materiadex.com
 */
/* Description:
 * Update Materia Orchestrator
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
	address oldMateriaOrchestrator = <oldMateriaOrchestrator>; //possibly with correct references to the old Materia operators
	address newMateriaOrchestrator = <newMateriaOrchestrator>; //must be already deployed with a correct reference to the DFO double proxy
	
	IMateriaOrchestrator(oldMateriaOrchestrator).retire(newMateriaOrchestrator);
    }
}

interface IMateriaOrchestrator {
    function retire(address newOrchestrator) external;
}
