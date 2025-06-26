# 🆔 Decentralized Identity Verification System

## 📘 Project Description

A decentralized system for identity registration and verification where users can submit personal metadata (e.g. documents) and authorized verifiers approve or reject it.

## 🌍 Project Vision

Provide a trustless, transparent, and on-chain mechanism for any identity registratio, identity authentication, reducing reliance on centralized KYC solutions.

## 🔑 Key Features

- Identity submission with name and metadata (IPFS-based)
- Status tracking: Pending, Verified, Rejected
- Verifier role with authority to approve/reject
- Fully on chain records

## 🚀 Future Scope

- Integration with off chain data oracles for document validation identity registration
- Decentralized reputation scores based on verification history
- DID (Decentralized Identifiers) and W3C compliance
- Integration with soulbound tokens or zkProofs

## 📜 Deployment Instructions

```bash
npm install
npx hardhat compile
npx hardhat run scripts/deploy.js --network <your_network>
```

## Contract details
0x820b4dA45fcBdC5668934F93CcAA9CAb690115F6![alt text](image.png)
