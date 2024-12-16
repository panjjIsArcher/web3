// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Seline {
    bool private paused; // 是否暂停
    string public name;
    string public symbol; // 代币符号或者缩写
    uint8 public decimals; // 代币允许分割的小数位数
    uint256 public totalSupply; // 代币总供应量

    mapping(address => uint256) public balances; // 记录每个地址的余额
    mapping(address => mapping(address => uint256)) public allowance; // 允许 spender 在 owner 设定的额度内使用 owner 的代币，而无需 owner 直接操作每一笔交易

    constructor() {
        name = "Seline"; // 设置代币名称
        symbol = "SL"; // 设置代币缩写
        decimals = 18;
        totalSupply = 1000000000 * (10 ** uint256(decimals)); // 设置代币总供应量
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    modifier whenNotPaused() {
        require(!paused, "contract is paused");
        _;
    }

    modifier whenPaused() {
        require(paused, "contract is not paused");
        _;
    }

    // 返回特定地址拥有的代币余额
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    // 将_value数量的代币发送到_to地址
    function transfer(
        address _to,
        uint256 _value
    ) public whenNotPaused returns (bool) {
        require(_to != address(0), "excepted address"); // 接收者地址不能为0
        require(balances[msg.sender] >= _value, "Not enough balance"); // 发送者余额不足
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // 从from转移value的代币到to
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public whenNotPaused returns (bool) {
        require(balances[_from] >= _value, "Not enough balance"); // 发送者余额不足
        require(allowance[_from][msg.sender] >= _value, "Not enough allowance"); // owner允许授权使用的代币额度不足
        balances[_from] -= _value;
        balances[_to] += _value;
        allowance[_from][msg.sender] -= _value; // 减少发送者允许的代币数量
        emit Transfer(_from, _to, _value);
        gasleft(); // 获取剩余gas
        return true;
    }

    function pause() external whenNotPaused {
        paused = true;
    }

    function unpause() external whenPaused {
        paused = false;
    }
}
