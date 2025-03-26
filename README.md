# Aptos Penalty Withdrawal

## Description
Aptos Penalty Withdrawal is a smart contract built on the Aptos blockchain that allows users to deposit funds with a lock duration. If they attempt to withdraw before the unlock time, a penalty is deducted from the withdrawal amount. This mechanism encourages financial discipline and long-term savings while allowing early withdrawals with a penalty.

## Vision
The goal of this contract is to introduce a penalty-based withdrawal mechanism that discourages impulsive withdrawals and promotes responsible financial management. The contract can be used for various purposes, including savings plans, time-locked investments, and commitment-based crowdfunding.

## Future Scope
- Integration with governance mechanisms to allow dynamic penalty adjustments.
- Supporting multiple tokens beyond AptosCoin.
- Implementing emergency withdrawal options with varying penalty percentages.
- Introducing interest accrual for locked funds.
- Developing a front-end interface for easy interaction.

## Contract Details

### Functions:
1. **`deposit_funds(user: &signer, amount: u64, lock_duration: u64)`**
   - Allows a user to deposit funds with a specified lock duration.
   - Transfers the specified amount from the user's account and locks it.
   
2. **`withdraw_funds(user: &signer) acquires Deposit`**
   - Allows the user to withdraw funds.
   - If withdrawal occurs before the unlock time, a penalty (10% of the deposit) is deducted.
   - The remaining amount is transferred back to the user.

### Structs:
- **`Deposit`**
  - `amount: u64` → The total deposited amount.
  - `unlock_time: u64` → The timestamp when funds can be withdrawn without penalty.

## Deployment

### Prerequisites
- Install [Aptos CLI](https://aptos.dev/tools/cli/) and set up your Aptos account.
- Ensure you have test APT tokens for deployment.

### Steps
1. **Install Aptos CLI (if not already installed)**:
   ```sh
   curl -fsSL https://aptos.dev/download-cli-linux | bash  # Linux
   brew install aptos  # Mac
   iwr -useb https://aptos.dev/download-cli-windows | iex  # Windows
   ```
2. **Initialize Aptos project** (if not already done):
   ```sh
   aptos init
   ```
3. **Compile the contract**:
   ```sh
   aptos move compile
   ```
4. **Publish the contract**:
   ```sh
   aptos move publish --assume-yes
   ```
5. **Interact with the contract**:
   - Call `deposit_funds` and `withdraw_funds` using Aptos CLI or a frontend interface.

## Contract Address
0x660fb437813a2876bb3eecb12405cf512390ee2332300d8094615db9b152f704
![image](https://github.com/user-attachments/assets/848aa9a2-84be-4c89-9184-860b152044aa)

