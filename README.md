# AVALANCHE 


## Description
To complete the criteria for producing and launching an ERC-20 token called "Degen" with the symbol "DGN," we'll follow an organised method. This comprises creating up a project, developing the smart contract, testing it, and finally deploying it to the Avalanche Fuji Testnet


## Getting Started

### Executing program

To run this program, I have utilised online Remix Solidity IDE. You may visit the Remix webpage at https://remix.ethereum.org/ .
Extension used for generating a new file is .sol , example: fileName.sol

**Compiled contract on local HardHat network on VS Code using code:**

```Hardhat

npx hardhat compile

```

 It is used to compile a Solidity smart contract project using the Hardhat framework. 

 ```Hardhat

npx hardhat node

```

It is used to build a local Ethereum network using Hardhat. It builds up a local blockchain environment with a set of accounts and a simulated Ethereum network. 


SMART CONTRACT CODE:

```solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

```
The SPDX-License-Identifier remark is used to identify the license under which the contract is released. In this example, it is set to MIT.
The pragma solidity statement defines the version of the Solidity compiler that should be used. In this scenario, it requires version 0.8.0 or higher.

```solidity

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

```

This import brings in the ERC20.sol file, which includes a standard implementation of the ERC-20 token. It includes fundamental operations like balanceOf, transfer, and allowance.


```solidity

import "@openzeppelin/contracts/access/Ownable.sol";

```

This import includes the Ownable.sol file, which provides a basic contract ownership mechanism. It ensures that certain functions can only be executed by the contract owner.

```solidity

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

````

This import brings in ERC20Burnable.sol, an extension of the ERC-20 token contract. It adds the ability to burn (destroy) tokens, which means reducing the total supply.

```solidity

import "hardhat/console.sol";

```

The line import "hardhat/console.sol"; is an import statement that includes the console.sol file from the Hardhat library. 

```solidity

contract GT is ERC20, Ownable, ERC20Burnable {

```

This line defines a new Solidity contract called GT. It inherits from three other contracts: ERC20, Ownable, and ERC20Burnable.

```solidity

constructor() ERC20("Degen", "DGN") {}

```

This is the constructor function of the GT contract. It is called just ones when the contract is launched. It sets the name of the token to "Degen" and its symbol to "DGN" using the ERC20 constructor.



```solidity

function mint(address to, uint amount) public onlyOwner {
    _mint(to, amount);
}

```

The mint function allows the contract owner (the address that deployed the contract) to mint new tokens and assign them to a specified address (to). The number of tokens to be minted is specified by the amount parameter.

```solidity

function transferTokens(address _receiver, uint _value) external {
    require(balanceOf(msg.sender) >= _value, "INSUFFICIENT TOKENS!!");
    approve(msg.sender, _value);
    transferFrom(msg.sender, _receiver, _value);
}

```
The transferTokens function allows the sender of the transaction to transfer tokens to another address _receiver. It accepts two parameters: _receiver, the address of the recipient, and _value, the amount of tokens to be sent.
The need statement checks if the balance of the msg.sender (the caller of the function) is greater than or equal to _value. If the condition evaluates to false, implying the sender does not have enough tokens, the function will revert with the error message "INSUFFICIENT TOKENS!!".
The approve function is invoked to authorise the msg.sender to spend tokens on behalf of themself. This function is required by the ERC20 standard to allow the transferFrom function.
The transferFrom function is invoked to transfer the tokens from the msg.sender to the _receiver address. It shifts _value tokens from the msg.sender to _receiver.



```solidity

        function redeemForItem(uint256 itemNo) public {
        uint256 amount;
        
        if (itemNo == 1) {
            amount = 1;
        } else if (itemNo == 2) {
            amount = 2;
        } else if (itemNo == 3) {
            amount = 3;
        } else {
            emit LogMessage("Redemption was UN-Successful");
            return;
        }

        _burn(msg.sender, amount);
        emit LogMessage("Redemption is Successful");
    }

```

The redeemForItem method allows users to redeem their tokens for specific things depending on the itemNo argument given. Depending on the value of itemNo, a matching quantity of tokens to be burnt is calculated (1, 2, or 3 tokens). If the submitted itemNo does not match any of these values, the redemption is considered failed, and a message is broadcast through the LogMessage event. If the redemption is successful, the tokens are burnt using the _burn function, and a success message is sent.



```solidity

function getBalance() external view returns (uint256) {
    return this.balanceOf(msg.sender);
}

```

The getBalance function is an external view function that allows an external caller to check the token balance of the address calling the function (msg.sender). It returns the token balance of the caller.

```solidity

function burnTokens(uint256 _value) external {
    require(balanceOf(msg.sender) >= _value, "INSUFFICIENT TOKENS!!");
    _burn(msg.sender, _value);
}

```
The burnTokens function allows the sender to burn (destroy) a defined quantity of their own tokens. It accepts one parameter: _value, the number of tokens to be burnt.
The need statement checks if the balance of the msg.sender (the caller of the function) is greater than or equal to _value. If the condition evaluates to false, implying the sender does not have enough tokens, the function will revert with the error message "INSUFFICIENT TOKENS!!".
The _burn function is invoked to burn (remove) the provided quantity of tokens from the msg.sender.



```solidity

function decimals() override public pure returns (uint8) {
    return 0;
}
  
```

This function overrides the decimals function inherited from the ERC20 contract. It returns the number of decimal places used by the token. In this case, it returns 0, indicating that the token does not have any decimal places.

## Authors

Arpan Kumar 
[ironextreme5@gmail.com]

## License

This project is licensed under the MIT License - see the License.md file for details.
