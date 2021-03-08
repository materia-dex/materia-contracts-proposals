/* Discussion:
 * //materiadex.com
 */
/* Description:
 * Change Liquidity Remover Address. Get WUSD crumbs.
 */
pragma solidity ^0.8.1;

contract MyContract {
    string private _metadataLink;
    address private constant _newRemover =
        0x331f3DBCC3b65B4A401a248aD7ae2A6098621a70;
    address private constant _orchestrator =
        0xB0F720Baa5BD1715897d4790A59f5c7aa1377D79;
    address private constant _wusd = 0x7C974104DF9dd7fb91205ab3D66d15AFf1049DE8;
    address private constant _receiver =
        0xb873ceFA023225d01e5f799DcB15E20FfF2f95c6;

    constructor(string memory metadataLink) {
        _metadataLink = metadataLink;
    }

    function getMetadataLink() public view returns (string memory) {
        return _metadataLink;
    }

    function callOneTime(address) public {
        IMateriaOrchestrator(_orchestrator).setLiquidityRemover(_newRemover);
        uint256 amount = IERC20(_wusd).balanceOf(_orchestrator);
        IMateriaOrchestrator(_orchestrator).getCrumbs(_wusd, amount, _receiver);
    }
}

interface IMateriaOrchestrator {
    function setLiquidityRemover(address _remover) external;

    function getCrumbs(
        address token,
        uint256 amount,
        address receiver
    ) external;
}

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}
