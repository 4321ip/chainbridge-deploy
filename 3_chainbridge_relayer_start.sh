cd ../

set -a; source ./chainbridge.env; set +a
rm ./config1.json
rm ./config2.json
rm ./config3.json
echo "{
  \"chains\": [
    {
      \"name\": \"rinkeby\",
      \"type\": \"ethereum\",
      \"id\": \"0\",
      \"endpoint\": \"$EP_RINKEBY\",
      \"from\": \"$RELAYER_ADDR1\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER_ERC20\",
        \"erc721Handler\": \"$HANDLER_ERC721\",
        \"genericHandler\": \"$HANDLER_ERC20\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"binance\",
      \"type\": \"ethereum\",
      \"id\": \"1\",
      \"endpoint\": \"$EP_BINANCE\",
      \"from\": \"$RELAYER_ADDR1\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER_ERC20\",
        \"erc721Handler\": \"$HANDLER_ERC721\",
        \"genericHandler\": \"$HANDLER_ERC20\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"polygon\",
      \"type\": \"ethereum\",
      \"id\": \"2\",
      \"endpoint\": \"$EP_POLYGON\",
      \"from\": \"$RELAYER_ADDR1\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER_ERC20\",
        \"erc721Handler\": \"$HANDLER_ERC721\",
        \"genericHandler\": \"$HANDLER_ERC20\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    }
  ]
}" >> ./config1.json
echo "{
  \"chains\": [
    {
      \"name\": \"rinkeby\",
      \"type\": \"ethereum\",
      \"id\": \"0\",
      \"endpoint\": \"$EP_RINKEBY\",
      \"from\": \"$RELAYER_ADDR2\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER_ERC20\",
        \"erc721Handler\": \"$HANDLER_ERC721\",
        \"genericHandler\": \"$HANDLER_ERC20\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"binance\",
      \"type\": \"ethereum\",
      \"id\": \"1\",
      \"endpoint\": \"$EP_BINANCE\",
      \"from\": \"$RELAYER_ADDR2\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER_ERC20\",
        \"erc721Handler\": \"$HANDLER_ERC721\",
        \"genericHandler\": \"$HANDLER_ERC20\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"polygon\",
      \"type\": \"ethereum\",
      \"id\": \"2\",
      \"endpoint\": \"$EP_POLYGON\",
      \"from\": \"$RELAYER_ADDR2\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER_ERC20\",
        \"erc721Handler\": \"$HANDLER_ERC721\",
        \"genericHandler\": \"$HANDLER_ERC20\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    }
  ]
}" >> ./config2.json
echo "{
  \"chains\": [
    {
      \"name\": \"rinkeby\",
      \"type\": \"ethereum\",
      \"id\": \"0\",
      \"endpoint\": \"$EP_RINKEBY\",
      \"from\": \"$RELAYER_ADDR3\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER_ERC20\",
        \"erc721Handler\": \"$HANDLER_ERC721\",
        \"genericHandler\": \"$HANDLER_ERC20\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"binance\",
      \"type\": \"ethereum\",
      \"id\": \"1\",
      \"endpoint\": \"$EP_BINANCE\",
      \"from\": \"$RELAYER_ADDR3\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER_ERC20\",
        \"erc721Handler\": \"$HANDLER_ERC721\",
        \"genericHandler\": \"$HANDLER_ERC20\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"polygon\",
      \"type\": \"ethereum\",
      \"id\": \"2\",
      \"endpoint\": \"$EP_POLYGON\",
      \"from\": \"$RELAYER_ADDR3\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER_ERC20\",
        \"erc721Handler\": \"$HANDLER_ERC721\",
        \"genericHandler\": \"$HANDLER_ERC20\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    }
  ]
}" >> ./config3.json




#goto virtual machine for relayer
#sshfs root@95.216.69.163:/home/node/chainbridge/chainbridge ~/dev/blockchain/vm_relay_folder
#cp ../config1.json ~/dev/blockchain/vm_relay_folder/config1.json
#cp ../config2.json ~/dev/blockchain/vm_relay_folder/config2.json
#cp ../config3.json ~/dev/blockchain/vm_relay_folder/config3.json

scp ./config1.json root@95.216.69.163:/home/node/chainbridge/chainbridge/config1.json
scp ./config2.json root@95.216.69.163:/home/node/chainbridge/chainbridge/config2.json
scp ./config3.json root@95.216.69.163:/home/node/chainbridge/chainbridge/config3.json
scp ./5_relayer_alpine.dockerfile root@95.216.69.163:/home/node/chainbridge/chainbridge/5_relayer_alpine.dockerfile

set -a; source ./chainbridge.env; set +a
ssh root@95.216.69.163 'cd /home/node/chainbridge/chainbridge; docker build -t relayer  -f ./5_relayer_alpine.dockerfile .'
ssh root@95.216.69.163 'cd /home/node/chainbridge/chainbridge; docker run -d -e PK='"'$RELAYER_PK1'"' -v $(pwd)/config1.json:/go/chainbridge/config.json  relayer'
ssh root@95.216.69.163 'cd /home/node/chainbridge/chainbridge; docker run -d -e PK='"'$RELAYER_PK2'"' -v $(pwd)/config2.json:/go/chainbridge/config.json  relayer'
ssh root@95.216.69.163 'cd /home/node/chainbridge/chainbridge; docker run -d -e PK='"'$RELAYER_PK3'"' -v $(pwd)/config3.json:/go/chainbridge/config.json  relayer'


#docker build -t relayer  -f ./5_relayer_alpine.dockerfile .
#docker run -it -d -e PK="$RELAYER_PK1" -v $(pwd)/config1.json:/go/chainbridge/config.json  relayer
