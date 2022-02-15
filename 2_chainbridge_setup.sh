cd ./cb-sol-cli/
set -a; source ../chainbridge.env; set +a

# 1 registers token as a resource with a bridge contract and configures which handler to use(Note: Sometimes the transaction confirmation will not be detected by the CLI. You can check the txhash in etherscan)
# -----RINKEBY------
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_RINKEBY_BINANCE
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_RINKEBY_POLYGON
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $WRAPPED_TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_BINANCE_RINKEBY
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $WRAPPED_TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_POLYGON_RINKEBY

cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --resourceId $RESOURCE_ID_ERC721_RINKEBY_BINANCE
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --resourceId $RESOURCE_ID_ERC721_RINKEBY_POLYGON
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --targetContract $WRAPPED_TOKEN_ERC721 --resourceId $RESOURCE_ID_ERC721_BINANCE_RINKEBY
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --targetContract $WRAPPED_TOKEN_ERC721 --resourceId $RESOURCE_ID_ERC721_POLYGON_RINKEBY


#---BINANCE-----
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_BINANCE_RINKEBY
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_BINANCE_POLYGON
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $WRAPPED_TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_RINKEBY_BINANCE
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $WRAPPED_TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_POLYGON_BINANCE

cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --resourceId $RESOURCE_ID_ERC721_BINANCE_RINKEBY
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --resourceId $RESOURCE_ID_ERC721_BINANCE_POLYGON
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --targetContract $WRAPPED_TOKEN_ERC721 --resourceId $RESOURCE_ID_ERC721_RINKEBY_BINANCE
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --targetContract $WRAPPED_TOKEN_ERC721 --resourceId $RESOURCE_ID_ERC721_POLYGON_BINANCE


#---POLYGON-----
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_POLYGON_BINANCE
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_POLYGON_RINKEBY
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $WRAPPED_TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_BINANCE_POLYGON
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC20 --targetContract $WRAPPED_TOKEN_ERC20 --resourceId $RESOURCE_ID_ERC20_RINKEBY_POLYGON

cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --resourceId $RESOURCE_ID_ERC721_POLYGON_BINANCE
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --resourceId $RESOURCE_ID_ERC721_POLYGON_RINKEBY
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --targetContract $WRAPPED_TOKEN_ERC721 --resourceId $RESOURCE_ID_ERC721_BINANCE_POLYGON
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge register-resource \
    --bridge $BRIDGE --handler $HANDLER_ERC721 --targetContract $WRAPPED_TOKEN_ERC721 --resourceId $RESOURCE_ID_ERC721_RINKEBY_POLYGON

ECHO 'COMPLETE'
exit 1

# 2 registers the token as mintable/burnable on the bridge.
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --tokenContract $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --tokenContract $WRAPPED_TOKEN_ERC721

cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --tokenContract $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC721 \
    --tokenContract $WRAPPED_TOKEN_ERC721

cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge set-burn \
    --bridge $BRIDGE \
    --handler $HANDLER_ERC20 \
    --tokenContract $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 bridge set-burn \
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

cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC20 \
    --erc20Address $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC721 \
    --erc20Address $WRAPPED_TOKEN_ERC721

cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC20 \
    --erc20Address $WRAPPED_TOKEN_ERC20
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 add-minter \
    --minter $HANDLER_ERC721 \
    --erc20Address $WRAPPED_TOKEN_ERC721

