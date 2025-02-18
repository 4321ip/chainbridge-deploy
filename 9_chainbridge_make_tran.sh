
set -a; source ../chainbridge.env; set +a

# Approve the handler to spend tokens on our behalf (to transfer them to the token safe).
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 1000000 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 1000000 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 1000000 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20

#Execute a deposit.
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 deposit \
    --amount 1 \
    --dest 2\
    --bridge $BRIDGE \
    --recipient $ADDR \
    --resourceId $RESOURCE_ID_ERC20_RINKEBY_POLYGON

cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 deposit \
    --amount 111 \
    --dest 0\
    --bridge $BRIDGE \
    --recipient $ADDR \
    --resourceId $RESOURCE_ID_ERC20_POLYGON_RINKEBY

cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 allowance \
    --owner $ADDR \
    --spender $HANDLER_ERC20 \
    --erc20Address $TOKEN_ERC20

#Approve the handler on the destination chain to move tokens on our behalf (to burn them).
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 100 \
    --erc20Address $WRAPPED_TOKEN_ERC20 \
    --recipient $HANDLER_ERC20
#Transfer the wrapped tokens back to the bridge.
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 deposit \
    --amount 100 \
    --dest 0 \
    --bridge $BRIDGE \
    --recipient $ADDR \
    --resourceId $RESOURCE_ID_ERC20_RINKEBY_POLYGON

cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 allowance \
    --owner $ADDR \
    --spender $HANDLER_ERC20 \
    --erc20Address $WRAPPED_TOKEN_ERC20



cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc721 approve \
    --id "0x1" \
    --erc721Address $TOKEN_ERC721 \
    --recipient $HANDLER_ERC721

cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc721 deposit \
    --id "0x1" \
    --dest 1 \
    --bridge $BRIDGE \
    --recipient $ADDR \
    --resourceId $RESOURCE_ID_ERC721_RINKEBY_BINANCE


export SSS="f195f0deec3586febeb7fe54ea5bf0648c3301171a3b519c61312097fc86ab36"
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $SSS --gasPrice 10000000000 erc20 approve \
    --amount 1000000 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20
