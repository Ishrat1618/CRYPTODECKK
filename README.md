# CRYPTODECKK
# 🃏 FairDeck — On-Chain Card Pulling Game (with Probable Fairness)

## 🎯 Project Description
*FairDeck* is a beginner-friendly Solidity project that demonstrates how to build a simple *on-chain deck of cards* where anyone can *pull cards fairly* using a commit–reveal mechanism.  

This project introduces the concept of *probable fairness* — a lightweight way to ensure that no one can manipulate the outcome of a shuffle after committing to it. It’s designed for blockchain beginners who want to learn about:
- Smart contract randomness (commit–reveal pattern)
- Verifiable fairness
- Solidity fundamentals (arrays, loops, events, modifiers)

---

## 💡 What It Does
1. *Commit Phase:*  
   The contract owner commits to a secret seed by storing its hash on-chain.

2. *Reveal Phase:*  
   Later, the owner reveals the original seed.  
   The contract verifies the seed and uses it to *shuffle a 52-card deck* on-chain in a deterministic and verifiable way.

3. *Pull Phase:*  
   Anyone can pull a card from the shuffled deck, one at a time.  
   Every card draw is recorded on-chain, and all participants can verify the fairness by checking the revealed seed.

---

## ✨ Features
- 🧠 *Beginner-friendly Solidity code:* Simple syntax with detailed comments.  
- 🔐 *Commit–reveal fairness:* Ensures the deck cannot be changed after commitment.  
- 🔁 *Deterministic shuffle:* Verifiable Fisher–Yates algorithm using a public seed.  
- 🃏 *On-chain deck management:* 52 cards stored and drawn from blockchain state.  
- 🪙 *Transparent draws:* Every card pull emits an event for easy tracking.  
- 🧩 *Educational example:* Perfect for learning randomness patterns in Solidity.  

---

## 🚀 Deployed Smart Contract
*Network:* XXX  
*Contract Address:* https://celo-sepolia.blockscout.com/tx/0x9c0355872b67bc65ed17f6c00c21261396183166386dd487a4d5004d9afa6ae6
*Block Explorer:* [View on XXX](XXX)

---

## 📄 Smart Contract Code
```solidity
//paste your code
<img width="935" height="457" alt="image" src="https://github.com/user-attachments/assets/11308d03-b8b0-4ec3-969d-ab2d5edc3efb" />
