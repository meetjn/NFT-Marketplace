// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        // Read SVG files
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg"); // Corrected file name

        // Log the SVG content to the console
        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImageURI(sadSvg),
            svgToImageURI(happySvg)
        );

        vm.stopBroadcast();
        // console.log(sadSvg);
        // console.log(happySvg);
        return moodNft;
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        
        // Encode the SVG to Base64
        string memory svgBase64Encoded = Base64.encode(bytes(svg));
        
        // Return the complete data URI
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}