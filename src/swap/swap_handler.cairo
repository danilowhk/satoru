//! Contract to help with swap functions.

// *************************************************************************
//                                  IMPORTS
// *************************************************************************
// Core lib imports.
use starknet::ContractAddress;

// Local imports.
use satoru::swap::swap_utils::{SwapParams};

// *************************************************************************
//                  Interface of the `SwapHandler` contract.
// *************************************************************************
#[starknet::interface]
trait ISwapHandler<TContractState> {
    /// Perform a swap based on the given params.
    /// # Arguments
    /// * `params` - SwapParams.
    /// # Returns
    /// * (outputToken, outputAmount)
    fn swap(ref self: TContractState, params: SwapParams) -> (ContractAddress, u128);
}

#[starknet::contract]
mod SwapHandler {
    // *************************************************************************
    //                               IMPORTS
    // *************************************************************************
    // Core lib imports    
    use result::ResultTrait;
    use starknet::ContractAddress;

    // Local imports.
    use satoru::swap::error::SwapError;
    use satoru::swap::swap_utils::SwapParams;

    // *************************************************************************
    //                              STORAGE
    // *************************************************************************
    #[storage]
    struct Storage {}

    // *************************************************************************
    //                              CONSTRUCTOR
    // *************************************************************************

    /// Constructor of the contract.
    #[constructor]
    fn constructor(ref self: ContractState) {}


    // *************************************************************************
    //                          EXTERNAL FUNCTIONS
    // *************************************************************************
    #[external(v0)]
    impl SwapHandler of super::ISwapHandler<ContractState> {
        fn swap(ref self: ContractState, params: SwapParams) -> (ContractAddress, u128) {
            (0.try_into().unwrap(), 0)
        }
    }
}
