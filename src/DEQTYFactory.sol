// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./DEQTYProject.sol";

contract DEQTYFactory {
  address[] private deployedProjects;
  mapping(uint256 => bool) private identifiers;

  event ProjectDeployed(address indexed deployedAddress, address indexed ownerAddress, uint256 identifier);

  function getProjectsLength() external view returns (uint256) {
    return deployedProjects.length;
  }

  function getProject(uint256 _index) external view returns (address) {
    require(_index < deployedProjects.length, "Invalid index");
    return deployedProjects[_index];
  }

  function deploy(
    string calldata _name,
    string calldata _description,
    address _owner
  ) external returns (uint256 _identifier) {
    _identifier = getIdentifier();
    require(!identifiers[_identifier], "Identifier already used");
    identifiers[_identifier] = true;

    DEQTYProject project = new DEQTYProject(
        _name,
        _description,
        _identifier,
        _owner
    );
    deployedProjects.push(address(project));

    emit ProjectDeployed(address(project), msg.sender, _identifier);

    return _identifier;
  }

  function getIdentifier() private view returns (uint256) {
    uint256 _identifier = 1;
    while (identifiers[_identifier]) {
        _identifier = _identifier << 1;
    }
    return _identifier;
  }
}
