# CloseB Dashboard with MySQL + Flask + AppSmith

This repo contains a prototype of the Dashboard to manage logistics behind the marketplace [CloseB](https://closeb.net/).

## But first, what's CloseB?

CloseB is a marketplace of emerging online clothing brands initiated in Barcelona. The goal is to build a community to join marketing and advertising efforts, and therefore help them to get their projects off the ground. Our primary role is that of an intermediary, facilitating the promotion and sale of their products to a wider audience.

This repo contains a prototype of the dashboards for both the marketplace admin and the brands:

* The marketplace admin can manage shipments for the incoming orders and returns, view information about clients, and track sales performance.
* The brand can create, update and delete their products in the database.

## Structure

This repo contains a boilerplate setup for spinning up 3 Docker containers: 

* A MySQL 8 container to manage the database (**db** folder).
* A Python Flask container to implement a REST API (**flask-app** folder). Furthermore, the folder **thunder-tests** contains some tests created with Thunder Client to test the routes.
* A Local AppSmith Server.

The AppSmith app is stored in the repo [CloseB-DB-FrontEnd](https://github.com/MiquelAlberti2/CloseB-DB-FrontEnd).

## Installation

Install Docker Desktop and follow these steps:

1. Clone this repository.  
2. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
3. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp. 
4. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
5. Build the images with `docker compose build`
6. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

After that, you should be able to run AppSmith locally by typing the URL http://localhost:8080/. Then, you can import the app from the [CloseB-DB-FrontEnd](https://github.com/MiquelAlberti2/CloseB-DB-FrontEnd) repo.




