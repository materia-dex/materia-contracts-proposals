/* Discussion:
 * //materiadex.com
 */
/* Description:
 * Transfer GIL Funds from DFOhub Wallet to Operation funds for: Liquidity Mining Season 2
 */
pragma solidity ^0.7.6;
pragma abicoder v2;

contract ProposalCode {

    string private _metadataLink;
    //The Operations where to transfer GIL TOKENs
    address constant private WALLET = 0xb873ceFA023225d01e5f799DcB15E20FfF2f95c6;

    constructor(string memory metadataLink) {
        _metadataLink = metadataLink;
    }

    function getMetadataLink() public view returns(string memory) {
        return _metadataLink;
    }

    function onStart(address, address) public {
    }

    function onStop(address) public {
    }

    function callOneTime(address) public {
        IMVDProxy proxy = IMVDProxy(msg.sender);
        IVotingToken votingToken = IVotingToken(proxy.getToken());

        uint256 amount = 1500000*1e18;
        //1 - transfer erc20 tokens
        proxy.transfer(WALLET, amount, address(votingToken));
    }
}

interface IMVDProxy {
    function getToken() external view returns(address);
    function transfer(address receiver, uint256 value, address token) external;
}

interface IVotingToken {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function safeApprove(address spender, uint256 amount) external;
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function decimals() external view returns (uint8);
    function mint(uint256 amount) external;
    function burn(uint256 amount) external;
}