# UNC Data Model - GraphQL

This project uses Apollo Server and GraphQL to define a UNC data model.

UNC is a Unified Network Connectivity model designed for utility networks, in particular, electrical networks.

## Running


Run npm install to install dependencies etc

	npm install

Then run index.js to start up the Apollo server

	node index.js

Then you can access the Apollo playground at http://localhost:4000

## Loading data and querying

There are examples in the `examples/` directory of using mutations to generate lines & junctions, and querying them.
Run each one in sequence starting with the files in `examples/mutations`
