# DEQTY Contracts

DEQTY is a zero knowledge grunt fund manager written in solidity. Grunt funds are a tool to provide fiscal value to all contributions in a project. That fiscal value can later be turned into equity or other form of compensation.

The DEQTY factory allows anyone to deploy a new project contract, that then is used to log the contributions of the participants (grunts). Contributions can be hours of work, capital or sales.

Currently the protoype only allows import of contribution hours. DEQTY is a tool in the SwissDAO ecosystem, but can be used as a primitive in other ecosystems.

## Zero Knowledge Application

DEQTY is using ZK technology to preserve the privacy of the contributors, and to ensure contributors are human:

- A sismo group gitcoin-passport-holders is queried to ensure that contributors are human.
- A DEQTY group is used to ensure that contributors are project members. This is achieved by altering the score (see below)

**Use of score for access control:** Each project contract has an identifier, and the users score represents a bitmosk of all identifiers the user is allowed to used. Access is checked by masking the user score with the contract identifier. 

## Deployment

Factory Mumbai Testnet: 0xefB01A6DdFef8680108a082D4991411c32BB1a70
