# dmpethics


[![DOI](https://zenodo.org/badge/150131683.svg)](https://zenodo.org/badge/latestdoi/150131683)


Dmpethics is a web application that helps researchers going through the ethics approval process. It is connected with a Semantic MediaWiki, which is used to make the ethics process public, transparent and searchable.


# Installing / Getting started
Dmpethics is divided into a front-end and back-end application. 

## dmp-back
A Ruby on Rails API application that controls and manages data for the frontend. Handles all requests to the MediaWiki action API.

### Requirements
* Ruby 2.5.1
* Ruby on Rails 5.2.2.

### Installation

<pre>
cd dmpethics-back
gem install
rake db:migrate
</pre>

This installs all needed Ruby gems and performs a database migration to get your database up to date.

### Run
<pre>
rails server
</pre>
After the server has been started, it runs by default on localhost:3000.

## dmp-front
A Vue.js application that provides an interface. Uses axios for GET/POST/PUT/DELETE requests to the backend.

### Requirements
* Vue2
* Yarn

### Installation
<pre>
cd dmpethics-front
yarn install
</pre>

This install all needed dependencies.

### Run 
<pre>
yarn serve
</pre>
After the server has been started, it runs by default on localhost:4000.
