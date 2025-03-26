module MyModule::PenaltyWithdrawal {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::timestamp;

    struct Deposit has store, key {
        amount: u64,
        unlock_time: u64,
    }

    public fun deposit_funds(user: &signer, amount: u64, lock_duration: u64) {
        let unlock_time = timestamp::now_seconds() + lock_duration;
        let deposit = Deposit { amount, unlock_time };
        let funds = coin::withdraw<AptosCoin>(user, amount);
        coin::deposit<AptosCoin>(signer::address_of(user), funds);
        move_to(user, deposit);
    }

    public fun withdraw_funds(user: &signer) acquires Deposit {
        let deposit = borrow_global_mut<Deposit>(signer::address_of(user));
        let current_time = timestamp::now_seconds();
        let penalty = if (current_time < deposit.unlock_time) { deposit.amount / 10 } else { 0 };
        let withdraw_amount = deposit.amount - penalty;
        let recipient = signer::address_of(user);
        coin::transfer<AptosCoin>(user, recipient, withdraw_amount);
    }
}
