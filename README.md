# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.4.4

* System dependencies

* Configuration

* Database creation

* Database initialization

                ###INITALISATION 

                @pages1 = Page.new
                @pages1.name = 'Accueil'
                @pages1.save

                @pages2 = Page.new
                @pages2.name = 'Qui sommes nous?'
                @pages2.save

                @pages3 = Page.new
                @pages3.name = 'Comment ?a marche?'
                @pages3.save

                @pages4 = Page.new
                @pages4.name = 'cgu'
                @pages4.save


                ## DANS LE CMD DE MYSQL ou dans l'insterface graphique ##########

                ALTER TABLE `identities` ADD `user_id` INT NOT NULL AFTER `about`;
                ALTER TABLE `annonces` CHANGE `prix` `prix` INT(50) NULL DEFAULT NULL; // Pour les gens qui veulent  vendre des trus de plusieurs milillares


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
