

// Instaling Mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update
sudo apt-get install -y mongodb-org
// You should now have mongo installed,  double check with mongo --version 


-mongod   // starts the demon
-mongo    // opens a shell (quit with ctr +c)
-help
-show dbs  // shows all the databases
-use
-insert   // a collection  <db.dogs.inser({})>
-find     // <db.dogs.find()>
=update
-remove


Mongoose = "Object Document Modeling (ODM) package for Express"> 


RESTFUL ROUTES
 name          url             verb         desc
 ==================================================
 INDEX         /dogs           GET          Displays list of all dogs
 NEW           /dogs/new       GET          Displays form to create a new dog
 CREATE        /dogs           POST         Add new dog to DB
 SHOW          /dogs/:id       GET          Shows info about one dog.