// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/forge-std/src/Test.sol";
import "../src/DEQTYFactory.sol";

contract TestDEQTYFactory is Test {
    DEQTYFactory private factory;

    function beforeEach() public {
        factory = new DEQTYFactory(address(this));
    }

    function testDeployProject() public {
        // Deploy a project
        string memory projectName = "Test Project";
        string memory projectDescription = "This is a test project";
        address projectOwner = address(0x123);

        uint256 projectIdentifier = factory.deploy(projectName, projectDescription, projectOwner);

        // Get the deployed project
        address deployedProject = factory.getProject(0);

        // Verify project details
        assert.equal(DEQTYProject(deployedProject).project.projectName(), projectName, "Incorrect project name");
        assert.equal(DEQTYProject(deployedProject).project.projectDescription(), projectDescription, "Incorrect project description");
        assert.equal(DEQTYProject(deployedProject).prooject.projectNumber(), projectIdentifier, "Incorrect project identifier");
        assert.equal(DEQTYProject(deployedProject).project.projectOwner(), projectOwner, "Incorrect project owner");
    }

    function testGetProjectsLength() public {
        // Deploy two projects
        factory.deploy("Project 1", "Description 1", address(0x123));
        factory.deploy("Project 2", "Description 2", address(0x456));

        // Get the length of deployed projects
        uint256 projectsLength = factory.getProjectsLength();

        // Verify the length
        assert.equal(projectsLength, 2, "Incorrect projects length");
    }

    function testGetProject() public {
        // Deploy a project
        address projectOwner = address(0x123);
        factory.deploy("Test Project", "This is a test project", projectOwner);

        // Get the deployed project
        address deployedProject = factory.getProject(0);

        // Verify the project address
        assert.equal(deployedProject, DEQTYProject(deployedProject), "Incorrect project address");
    }
}
