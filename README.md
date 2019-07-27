# HashFreaks

## Idea

We will be working on a proof of concept for an Electronic Voting Machine interface, that will store all the data on a permissioned blockchain. It will be a web application where a voter will first have to enter their voter ID. Then the voter will be voting for his desired party. This information is then stored on a blockchain. Further, there will be a unique code (QR or alphanumeric) generated that will then allow the voters to verify their vote on a separate application after they've left the booth. After the whole election is over, we will also be providing an analytics page post election, which will give us many statistical details of the election, such as the percentage of people who voted, percentage of votes to each party,etc immediately once the election ends.

## Features 

The most important feature that the application will provide is that it will allow the citizens to vote from a different constituency. In the 2019 elections, over 290 million Indians who were eligible to vote - over 18 years of age and with their names in the electoral rolls - did not vote. Another feature of the app is that it ensures that the EVM cannot be hacked, as the data that is once stored on a blockchain is immutable. This is an age old problem in the election, where EVM's are hacked, thereby comporomising the election. The app will also generate unique codes whenever a voter has voted. This will help him confirm that his vote has been counted. Another useful feature this proof of concept will provide, is that the results will be made available instantly, and the EVM's need not be kept locked up and under security while the other phases of the election go on. This saves on a lot of the personnel and infrastructure cost, which can be used in other places to ensure that the election proceeds smoothly.

## Tools

We, in the beginning, will use azure blockchain services to build a business network, followed by developping a back-end REST API. Then we will make a web application (tentatively using Angular 8), that will work as the EVM user interface. For analytics, we will use the azure workbench and use that to host the application on the cloud. We will use Github extensively. 
