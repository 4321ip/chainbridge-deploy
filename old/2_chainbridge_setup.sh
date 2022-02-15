cd ./cb-sol-cli/
set -a; source ../chainbridge.env; set +a
#//---------------source-----------------
#2. Configure contracts on Source (Note: Sometimes the transaction confirmation will not be detected by the CLI. You can check the txhash in etherscan)
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $TOKEN_ERC20
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --resourceId $RESOURCE_ID_ERC721

cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $TOKEN_ERC20
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --resourceId $RESOURCE_ID_ERC721

cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $TOKEN_ERC20
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --resourceId $RESOURCE_ID_ERC721

#//---------------dest-----------------
#Configure contracts on Destination¶
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --resourceId $RESOURCE_ID_ERC721 \
    --targetContract $WRAPPED_TOKEN_ERC721
#registers the token as mintable/burnable on the bridge.
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --tokenContract $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --tokenContract $WRAPPED_TOKEN_ERC721
#gives permission for the handler to mint new wrapped tokens.
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC20 \
    --erc20Address $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC721 \
    --erc20Address $WRAPPED_TOKEN_ERC721

#Configure contracts on Destination¶
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --resourceId $RESOURCE_ID_ERC721 \
    --targetContract $WRAPPED_TOKEN_ERC721
#registers the token as mintable/burnable on the bridge.
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --tokenContract $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --tokenContract $WRAPPED_TOKEN_ERC721
#gives permission for the handler to mint new wrapped tokens.
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC20 \
    --erc20Address $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC721 \
    --erc20Address $WRAPPED_TOKEN_ERC721

#Configure contracts on Destination¶
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --resourceId $RESOURCE_ID_ERC20 \
    --targetContract $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --resourceId $RESOURCE_ID_ERC721 \
    --targetContract $WRAPPED_TOKEN_ERC721
#registers the token as mintable/burnable on the bridge.
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --tokenContract $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --tokenContract $WRAPPED_TOKEN_ERC721
#gives permission for the handler to mint new wWEENUS tokens.
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC20 \
    --erc20Address $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC721 \
    --erc20Address $WRAPPED_TOKEN_ERC721

