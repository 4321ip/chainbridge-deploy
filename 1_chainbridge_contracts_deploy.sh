#!!! ВАЖНО !!!! в этот момент во всех сетях должен быть одинаковый nonce
set -a; source ../chainbridge.env; set +a
# deploy the bridge contract and ERC20 handler contract on the source (Rinkeby)¶
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 deploy \
    --bridge --erc20 --erc20Handler \
    --relayers $ADDR \
    --relayerThreshold 1\
    --chainId 0
#3. deploy the bridge contract and ERC20 handler contract on the Destination (binance)¶
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 deploy\
    --bridge --erc20 --erc20Handler \
    --relayers $ADDR \
    --relayerThreshold 1 \
    --chainId 1
#3. deploy the bridge contract and ERC20 handler contract on the Destination (binance)¶
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 deploy\
    --bridge --erc20 --erc20Handler \
    --relayers $ADDR \
    --relayerThreshold 1 \
    --chainId 2

#!!!!установить!!!! переменные в ./chainbridge.env
#BRIDGE="<resulting bridge contract address>"
#HANDLER="<resulting erc20 handler contract address>"
#WRAPPED_TOKEN="<resulting wrapped erc20 token address>"
set -a; source ../chainbridge.env; set +a
