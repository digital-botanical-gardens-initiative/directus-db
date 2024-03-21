FROM postgres:latest
FROM postgis/postgis:13-master

# Start the postgres server
CMD ["postgres"]    
