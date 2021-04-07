if [[ $1 == "POST" ]]
then
  printf "\nPOST categories\n\n"

  curl -i -H "Content-Type:application/json" -X \
  POST http://localhost:4000/categories/ -d \
  '{"name": "Category 1", "description":"Category 1 - Description"}'

  printf "\n\n"

  curl -i -H "Content-Type:application/json" -X \
  POST http://localhost:4000/categories/ -d \
  '{"name": "Category 2", "description":"Category 3 - Description"}'

  printf "\n\n"

  curl -i -H "Content-Type:application/json" -X \
  POST http://localhost:4000/categories/ -d \
  '{"name": "Category 3", "description":"Category 3 - Description"}'

  printf "\n\n"

elif [[ $1 == "GET" ]]
then

  if [[ $2 ]]
  then
    printf "\nGET specific category\n\n"

    curl -i -H "Content-Type:application/json" -X \
    GET http://localhost:4000/categories/$2

    printf "\n\n"
  else
    printf "\nGET categories\n\n"

    curl -i -H "Content-Type:application/json" -X \
    GET http://localhost:4000/categories/

    printf "\n\n"
  fi

elif [[ $1 == "PUT" ]]
then

  printf "\nPUT specific category\n\n"

  curl -i -H "Content-Type:application/json" -X \
  PUT http://localhost:4000/categories/$2 -d \
  '{"name": "Category EDITED", "description":"Category EDITED - Description"}'

  printf "\n\n"

elif [[ $1 == "DELETE" ]]
then

  printf "\nDELETE specific category\n\n"

  curl -X DELETE http://localhost:4000/categories/$2

  printf "\n\n"

else

  printf "\nOptions:\
  \nPOST\
  \nGET\
  \nGET id\
  \nPUT id\
  \nDELETE id"

fi