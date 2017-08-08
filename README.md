# README

https://catalog-press.herokuapp.com/   # <= Heroku app for testing and viewing

# Configuration #

* ruby **2.3.0p0**

* Rails **5.0.5**

* uses **Postgresql**  (*do not forget to install the database* )

## Deployment instructions ##
-
```
git clone https://github.com/JudeOstorn/catalog.git
```
```
cd catalog
```
```
bundle install
```
```
rails db:create
```
```
rails db:migrate
```
```
rails db:seed
```
```
rails server
```
