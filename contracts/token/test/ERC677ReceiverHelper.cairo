%lang starknet
%builtins pedersen range_check ecdsa

from starkware.cairo.common.cairo_builtins import HashBuiltin, SignatureBuiltin
from starkware.cairo.common.uint256 import Uint256

#
# Storage
#

@storage_var
func _data() -> (res: felt):
end

#
# ERC677Receiver
#

@external
func onTokenTransfer{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }(sender: felt, value: Uint256, data: felt):
    _data.write(data)
    return ()
end

#
# Getters
#

@view
func data{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }() -> (data: felt):
    let (data) = _data.read()
    return (data)
end