#!/bin/bash

# Connect to MongoDB without authentication
mongo --host localhost --port 27017 <<EOF
use inception
db.dummyData.insert({ nome: "henrique", project: "inception" })
db.dummyData.insertMany([
  { name: "duller", idade: "32" },
  {evaluator: "unknow", grade: "unknow" }
])
# db.collectionName.find().forEach(printjson)
quit()
EOF
