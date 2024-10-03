# Foundry NFT

In the Mood Nft Project, we go through creating 2 different kinds of NFTs.

An IPFS Hosted NFT
An SVG NFT (Hosted 100% on-chain)

## Getting Started

### Requirements

    git

### Quickstart

    git clone https://github.com/meetjn/NFT-Marketplace
    cd NFT-Marketplace
    forge install
    forge build

## Usage

### Start a local node

        make anvil

## Deploy

This will default to your local node. You need to have it running in another terminal in order for it to deploy.

    make deploy

### Test Coverage

    forge coverage

## Deployment to a testnet or mainnet

1. Setup environment variables

You'll want to set your SEPOLIA_RPC_URL and PRIVATE_KEY as environment variables. You can add them to a .env file, similar to what you see in .env.example.

PRIVATE_KEY: The private key of your account (like from metamask). NOTE: FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
You can learn how to export it here.

SEPOLIA_RPC_URL: This is url of the goerli testnet node you're working with. You can get setup with one for free from Alchemy
Optionally, add your ETHERSCAN_API_KEY if you want to verify your contract on Etherscan.

Get testnet ETH

Head over to faucets.chain.link and get some tesnet ETH. You should see the ETH show up in your metamask.

Deploy (IPFS NFT)
make deploy ARGS="--network sepolia"
Deploy (SVG NFT)
make deploySvg ARGS="--network sepolia"

## Scripts

After deploy to a testnet or local net, you can run the scripts.

Using cast deployed locally example:

cast send <RAFFLE_CONTRACT_ADDRESS> "enterRaffle()" --value 0.1ether --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL
or, to create a ChainlinkVRF Subscription:

make createSubscription ARGS="--network sepolia"

## Base64

To get the base64 of an image, you can use the following command:

    echo "data:image/svg+xml;base64,$(base64 -i ./images/dynamicNft/happy.svg)"

Then, you can get the base64 encoding of the json object by placing the imageURI into happy_image_uri.json then running:

    echo "data:application/json;base64,$(base64 -i ./images/dynamicNft/happy_image_uri.json)"

## Estimate gas

You can estimate how much gas things cost by running:

    forge snapshot

And you'll see and output file called .gas-snapshot

## Formatting

To run code formatting:

    forge fmt
