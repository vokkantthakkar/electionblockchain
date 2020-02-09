# HashFreaks

# Microsoft Codefundo++ 2019
This project was the winning entry for Microsoft Codefundo++ 2019 from Bits Pilani, Goa. The problem statement of the hackathon was to come up with a use-case of blockchain in the electoral system.

## Idea and Inspiration

The election system is prone to a lot of malpractices. This project tries to address one of the critical issues of the electoral systems.
The electronic voting machines are one of the most sought after punching bags post-elections. Thousands of articles related to tampering of EVM's surface in front of us post announcement of the final results. We tried to reduce the burden on EVM's by creating a solid tamper-proof supply model of EVM's. The government spends thousands of dollars for transportation and security of these EVM's so that they are not tampered with. Our supply design reduces these costs manifolds by the application of blockchain technology.

## Tools and Technology 

The project uses Microsoft Azure blockchain workbench and services and is coded in Solidity. 

## Design 

The blockchain stores the supply chain the EVM has travelled through, namely the manufacturer, the multiple counterparties
(district office, checkpoints) and an observer (Election officers overviewing the transportation). 

There are multiple nodes that are responsible for the security of the EVM. These nodes are namely, the Manufacturer, the transporter, the security personnel in charge, the DEO’s and a party representative. When the EVM is dispatched by the manufacturer, the manufacturer can call the "transfer responsibility" function, provide the ethereum address of the transporter, enter the seal status (true or false) and complete the transfer. 

Thus the EVM is now the responsibility of the transporter. The transfer responsibility function can be called multiple times, as the EVM travels through all the multiple users, until it finally reaches the polling station. If the seal status is ever tampered with, the entire transaction fails, and one can view the location where it was tampered, the party it was in possession of and the timestamp thus aiding the investigation.

The DEO’s and the party representatives are also part of the blockchain and can view the chain of custody of the EVM, thus ensuring complete transparency. This in turn makes the whole process more secure. This form of verification provides more security, ensuring
that the data provided isn’t compromised.

The application as of now is just a proof of concept, and not a complete working solution. Therefore, all the features are not currently
functional, but features like location tracking can be added. Further, instead of paper seals, IoT devices can be used and they can directly communicate with the blockchain if and when the seals are tampered with, along with the location and timestamp.
