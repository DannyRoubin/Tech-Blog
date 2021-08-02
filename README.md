# Tech-Blog

## App Description

This app allows users to share their thoughts on all things tech related as well as leave comments on each others posts.

## Motivation Behind the project/why I built it

I created this app to further my experience with using databases and backend code as well as to also gain experience using the MVC file layout

## Problems I came across during development

I came across many issues during the development of this app due to issues with handlebars which resulted in me restarting this project halfway through. I also had issues connecting routes but eventually got everything figured out.

## What I learned from this project

I expanded my knowledge of MVCs, handlebars, and routes and how to troubleshoot various issues with them.

## App usage (installation on your local machine)

To use this app on your local machine please follow these steps. First clone this github repo, next access the file on your local machine. change the .env.example file to be named .env and fill in your info on the two blank spots. Next open gitbash/terminal and navigate to the file location. Once there do an npm i. After the npm i is complete, open up the folder titled "db" and copy the code inside the schema.sql file and run that on a mysql workbench file. Next, navigate back to the terminal/gitbash and run "npm run seed". If you filled out the .env file correctly and ran the sql file this will seed your mysql database. the final step is to simply run "npm run start" and you will be able to run the app

## App usage (Heroku link)

To use the live version of this app simply click the following link and you'll be taken to the live site

## App usage (once you're on the app)

When first opening the site you will be put on the homepage, you will see blog posts that you can click on to open and read comments associated with each post. At any time you can click on the login link on the navbar to take you to a login/signup page where you can create your own account. After either logging in or signing up, you will be taken to the dashboard where you will be able to create your own post or modify any previously created ones.
