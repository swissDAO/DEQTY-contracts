// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract DEQTYProject {
    // Define the Project
    struct ProjectData {
        address projectCreator;
        uint256 projectNumber;
        string projectName;
        string projectDesc;
    }

    ProjectData public project;
    address public owner;

    mapping(address => uint256) private contributions;
    uint256 private totalContributions;

    constructor(
        string memory _projectName,
        string memory _projectDesc,
        uint256 _projectNumber,
        address _owner
    ) {
        owner = _owner;
        project.projectNumber = _projectNumber;
        project.projectName = _projectName;
        project.projectDesc = _projectDesc;
    }

    function addContribution(uint256 _amountInHours) public {
        // Ensure the sender isn't the project creator
        require(msg.sender != project.projectCreator, "Project Creator cannot contribute to own project");

        // Add the contribution
        contributions[msg.sender] += _amountInHours;
        totalContributions += _amountInHours;
    }

    function getMyTotalContributions() public view returns (uint256) {
        return contributions[msg.sender];
    }

    function getTotalContributions() public view returns (uint256) {
        return totalContributions;
    }
}
