// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title FairDeck
 * @notice Simple on-chain card deck with commit-reveal fairness
 * @dev Educational purpose only. Not for real money or production use.
 */
contract FairDeck {
    address public owner;

    // Commit-reveal data
    bytes32 public committedHash;
    bool public isCommitted;
    bool public isShuffled;

    // On-chain deck (cards represented as 0..51)
    uint8[] public deck;

    event SeedCommitted(bytes32 hash);
    event DeckShuffled(bytes seed);
    event CardPulled(address indexed player, uint8 card);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Step 1: Commit to a seed hash (keccak256 of a secret seed)
     * @param hash The hash of the secret seed
     */
    function commitSeed(bytes32 hash) external onlyOwner {
        require(!isCommitted, "Already committed");
        committedHash = hash;
        isCommitted = true;
        emit SeedCommitted(hash);
    }

    /**
     * @notice Step 2: Reveal the seed to shuffle the deck deterministically
     * @param seed The original seed (string or bytes)
     */
    function revealAndShuffle(bytes memory seed) external onlyOwner {
        require(isCommitted, "No seed committed");
        require(!isShuffled, "Already shuffled");
        require(keccak256(seed) == committedHash, "Seed mismatch");

        // Build deck 0..51
        for (uint8 i = 0; i < 52; i++) {
            deck.push(i);
        }

        // Fisher-Yates shuffle using the seed
        for (uint256 i = 0; i < deck.length; i++) {
            uint256 rand = uint256(keccak256(abi.encodePacked(seed, i)));
            uint256 j = i + (rand % (deck.length - i));
            (deck[i], deck[j]) = (deck[j], deck[i]);
        }

        isShuffled = true;
        emit DeckShuffled(seed);
    }

    /**
     * @notice Step 3: Pull the next card from the deck
     */
    function pullCard() external returns (uint8) {
        require(isShuffled, "Deck not ready");
        require(deck.length > 0, "Deck empty");

        uint8 card = deck[deck.length - 1];
        deck.pop();

        emit CardPulled(msg.sender, card);
        return card;
    }

    function remainingCards() external view returns (uint256) {
        return deck.length;
    }
}
