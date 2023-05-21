// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {SismoConnect} from "sismo-core/sismo-connect-solidity/SismoLib.sol";



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

    string public swissDAOclaimID = "0x091b1dae434d9de5eb51c34874e73351";
    string public gitcoinpassportID = "0xeb8feea83ddaf266a806ee40c1b04fba";
    
    mapping(uint256 => uint256) private contributions;
    uint256 private totalContributions;

    constructor(
        string memory _projectName,
        string memory _projectDesc,
        uint256 _projectNumber,
        address _owner,
        bytes16 appId
    ) SismoConnect(appId) {
        owner = _owner;
        project.projectNumber = _projectNumber;
        project.projectName = _projectName;
        project.projectDesc = _projectDesc;
    }

    function _addContribution(uint256 _amountInHours, uint256 myNewUserID) private {
        // Ensure the sender isn't the project creator
        //require(msg.sender != project.projectCreator, "Project Creator cannot contribute to own project");

        // Add the contribution
        contributions[myNewUserID] += _amountInHours;
        totalContributions += _amountInHours;
    }

    function _getMyTotalContributions(uint256 myNewUserId) private view returns (uint256) {
        return contributions[myNewUserId];
    }

    function _getTotalContributions() private view returns (uint256) {
        return totalContributions;
    }



    //from here sismo guards over your shoulder!

    function addContribution(bytes memory response, address to){
            ClaimRequest[] memory claims = new ClaimRequest[](2);
            claims[0] = buildClaim({groupId: gitcoinpassportID});
            claims[1] = buildClaim({groupId: swissDAOclaimID});
            
            SismoConnectVerifiedResult memory result = verify({
            responseBytes: respone,
            claims: claims  
            });
            uint256 myNewUserID = result.getUserId();
            _addContribution(_amountInHours, myNewUserID);
        }
    
    function getMyTotalContributions(myNewUserId);(bytes memory response, address to){
        ClaimRequest[] memory claims = new ClaimRequest[](2);
        claims[0] = buildClaim({groupId: gitcoinpassportID});
        claims[1] = buildClaim({groupId: swissDAOclaimID});
        
        SismoConnectVerifiedResult memory result = verify({
        responseBytes: respone,
        claims: claims  
        });
        uint256 myNewUserID = result.getUserId();
        _getMyTotalContributions(myNewUserID);
    }
    
    function getTotalContributions(bytes memory response, address to){
        ClaimRequest[] memory claims = new ClaimRequest[](2);
        claims[0] = buildClaim({groupId: gitcoinpassportID});
        claims[1] = buildClaim({groupId: swissDAOclaimID});
        
        SismoConnectVerifiedResult memory result = verify({
        responseBytes: respone,
        claims: claims  
        });
        uint256 myNewUserID = result.getUserId();
        getTotalContributions();
    }
}
