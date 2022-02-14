
set -a; source ../chainbridge.env; set +a
#//---------------source-----------------
#2. Configure contracts on Source (Note: Sometimes the transaction confirmation will not be detected by the CLI. You can check the txhash in etherscan)
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $TOKEN

cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $TOKEN

cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $TOKEN


#//---------------dest-----------------
#Configure contracts on Destination¶
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $WRAPPED_TOKEN
#registers the token as mintable/burnable on the bridge.
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER \
    --tokenContract $WRAPPED_TOKEN
#gives permission for the handler to mint new wrapped tokens.
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER \
    --erc20Address $WRAPPED_TOKEN

#Configure contracts on Destination¶
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $WRAPPED_TOKEN
#registers the token as mintable/burnable on the bridge.
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER \
    --tokenContract $WRAPPED_TOKEN
#gives permission for the handler to mint new wrapped tokens.
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER \
    --erc20Address $WRAPPED_TOKEN

#Configure contracts on Destination¶
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $WRAPPED_TOKEN
#registers the token as mintable/burnable on the bridge.
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER \
    --tokenContract $WRAPPED_TOKEN
#gives permission for the handler to mint new wWEENUS tokens.
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER \
    --erc20Address $WRAPPED_TOKEN

