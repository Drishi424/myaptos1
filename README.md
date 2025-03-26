# Aptos Penalty Withdrawal

## Description
Aptos Penalty Withdrawal is a simple smart contract built on the Aptos blockchain. It allows users to deposit funds with a lock duration. If they attempt to withdraw before the unlock time, a penalty is deducted from the withdrawal amount. This encourages users to keep funds locked for the intended period.

## Vision
The contract aims to introduce penalty-based withdrawal mechanisms to promote financial discipline and reduce premature fund withdrawals. It can be extended for use in savings plans, time-locked investments, or commitment-based crowdfunding.

## Future Scope
- Integration with governance mechanisms to allow dynamic penalty adjustments.
- Supporting multiple tokens instead of only AptosCoin.
- Adding emergency withdrawal options with higher penalties.
- Implementing interest accrual for locked funds.

## Contract Details

### Functions:
1. `deposit_funds(user: &signer, amount: u64, lock_duration: u64)`
   - Allows a user to deposit funds with a specified lock duration.
   - Transfers the specified amount from the user's account and locks it.
   
2. `withdraw_funds(user: &signer) acquires Deposit`
   - Allows the user to withdraw funds.
   - If withdrawal occurs before the unlock time, a penalty (10% of the deposit) is deducted.
   - The remaining amount is transferred back to the user.

### Structs:
- `Deposit`
  - `amount: u64` → The total deposited amount.
  - `unlock_time: u64` → The timestamp when funds can be withdrawn without penalty.

## Deployment

### Prerequisites:
- Install [Aptos CLI](https://aptos.dev/cli-tools/aptos-cli/) 
- Set up an Aptos account and configure your local environment.

### Steps:
1. Initialize an Aptos project (if not already set up):
   ```sh
   aptos init
   ```
2. Compile the Move contract:
   ```sh
   aptos move compile
   ```
3. Publish the contract to the Aptos network:
   ```sh
   aptos move publish --profile default
   ```
4. Interact with the contract using CLI or scripts to deposit and withdraw funds.
  ```
## Contract addresses
0x660fb437813a2876bb3eecb12405cf512390ee2332300d8094615db9b152f704
![image](https://github.com/user-attachments/assets/b205af01-34fd-4a3f-a7ac-11480b418452)
