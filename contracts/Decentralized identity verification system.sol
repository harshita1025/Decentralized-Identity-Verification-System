// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract IdentityVerification is Ownable {
    enum Status { Unverified, Pending, Verified, Rejected }

    struct Identity {
        string name;
        string metadataURI; // IPFS or off-chain metadata reference
        Status status;
    }

    mapping(address => Identity) public identities;
    mapping(address => bool) public verifiers;

    event IdentitySubmitted(address indexed user, string name, string metadataURI);
    event IdentityVerified(address indexed user, Status status);

    constructor(address initialOwner) Ownable(initialOwner) {}

    modifier onlyVerifier() {
        require(verifiers[msg.sender], "Not authorized verifier");
        _;
    }

    function addVerifier(address _verifier) external onlyOwner {
        verifiers[_verifier] = true;
    }

    function removeVerifier(address _verifier) external onlyOwner {
        verifiers[_verifier] = false;
    }

    function submitIdentity(string memory _name, string memory _metadataURI) external {
        require(bytes(_name).length > 0, "Name is required");
        require(bytes(_metadataURI).length > 0, "Metadata URI is required");

        identities[msg.sender] = Identity({
            name: _name,
            metadataURI: _metadataURI,
            status: Status.Pending
        });

        emit IdentitySubmitted(msg.sender, _name, _metadataURI);
    }

    function verifyIdentity(address user, bool approve) external onlyVerifier {
        require(identities[user].status == Status.Pending, "Identity not pending");
        identities[user].status = approve ? Status.Verified : Status.Rejected;
        emit IdentityVerified(user, identities[user].status);
    }

    function getIdentity(address user) external view returns (string memory, string memory, Status) {
        Identity memory id = identities[user];
        return (id.name, id.metadataURI, id.status);
    }

    function getMyStatus() external view returns (Status) {
        return identities[msg.sender].status;
    }
}
