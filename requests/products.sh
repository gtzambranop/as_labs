if [[ $1 == "POST" ]]
then
  printf "\nPOST products\n\n"

  curl -i -H "Content-Type:application/json" -X \
  POST http://localhost:4000/products/ -d \
  '{
    "name": "Product 1",
    "description": "Description - Product 1",
    "category": 1,
    "unit_measurement": "Units",
    "quantity": 34
  }'

  printf "\n\n"

  curl -i -H "Content-Type:application/json" -X \
  POST http://localhost:4000/products/ -d \
  '{
    "name": "Product 1",
    "description": "Description - Product 1",
    "category": 2,
    "unit_measurement": "Units",
    "quantity": 32
  }'

  printf "\n\n"

  curl -i -H "Content-Type:application/json" -X \
  POST http://localhost:4000/products/ -d \
  '{
    "name": "Product 1",
    "description": "Description - Product 1",
    "category": 3,
    "unit_measurement": "Units",
    "quantity": 123
  }'

  printf "\n\n"

elif [[ $1 == "GET" ]]
then

  if [[ $2 ]]
  then
    printf "\nGET specific category\n\n"

    curl -i -H "Content-Type:application/json" -X \
    GET http://localhost:4000/products/$2

    printf "\n\n"
  else
    printf "\nGET products\n\n"

    curl -i -H "Content-Type:application/json" -X \
    GET http://localhost:4000/products/

    printf "\n\n"
  fi

elif [[ $1 == "PUT" ]]
then

  printf "\nPUT specific category\n\n"

  curl -i -H "Content-Type:application/json" -X \
  PUT http://localhost:4000/products/$2 -d \
  '{
    "name": "Product EDITED",
    "description": "Description - Product EDITED",
    "category": 2,
    "unit_measurement": "Grams",
    "quantity": 34
  }'

  printf "\n\n"

elif [[ $1 == "DELETE" ]]
then

  printf "\nDELETE specific category\n\n"

  curl -X DELETE http://localhost:4000/products/2

  printf "\n\n"

else

  printf "\nOptions:\
  \nPOST\
  \nGET\
  \nGET id\
  \nPUT id\
  \nDELETE id"

fi