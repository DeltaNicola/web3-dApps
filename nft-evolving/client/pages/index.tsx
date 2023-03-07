import { ConnectWallet, ThirdwebNftMedia, useAddress, useContract, useOwnedNFTs, Web3Button } from "@thirdweb-dev/react";
import type { NextPage } from "next";
import styles from "../styles/Home.module.css";

const Home: NextPage = () => {
  const contractAddress = process.env.CONTRACT_KEY!;

  const { contract } = useContract(contractAddress)
  const address = useAddress();
  
  const { data: nfts } = useOwnedNFTs( contract, address );

  return (
    <div>
      <ConnectWallet />
      <hr />
      { nfts?.map((nft) => (
        <div key={nft.metadata.id.toString()}>
          <ThirdwebNftMedia 
            metadata={nft.metadata}
          />
          {nft.metadata.name}
        </div>
      ))}
      <Web3Button
        contractAddress={contractAddress}
        action={(contract) => contract.erc1155.claim(0, 1)}
      >claim one!</Web3Button>
      <hr />
      <Web3Button
        contractAddress={contractAddress}
        accentColor="red"
        action={(contract) => contract.call("evolve")}
      >evolve</Web3Button>
    </div>
  );
};

export default Home;
