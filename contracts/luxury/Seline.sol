// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Seline {
    string public name;
    string public symbol; // 代币符号或者缩写
    uint8 public decimals; // 代币允许分割的小数位数
    uint256 public totalSupply; // 代币总供应量
    mapping(address => uint256) public balances; // 记录每个地址的余额

    constructor() {
        name = "Seline"; // 设置代币名称
        symbol = "SL"; // 设置代币缩写
        decimals = 18;
        totalSupply = 1000000000 * (10 ** uint256(decimals)); // 设置代币总供应量
    }

    // 返回特定地址拥有的代币余额
    function balanceOf(address _owner) public view returns (uint256) {}
}
