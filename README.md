# A Django App Project Using Poetry
This is a small django polls app that uses poetry as dependency manager and posgtgres as backing database

### Requirements
1. Python 3.10.2+
2. Poetry 1.1.0+
3. Docker
4. docker-compose
5. All other requirements will be installed when building the docker image

### Instructions to run
1. After satisfying the above requirements,create a .env file from the .env.template and set the required vars.
2. Then simply run in terminal:
    ```bash
    docker-compose up --build
    ```
2. Access the app on browser via: http://localhost:8000
3. Enjoy!


### License
MIT, GLPv3

### Copyright
&copy; 2023, David Syengo, Quote the Author.
