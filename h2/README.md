# H2 Database Engine Container

This image provides a ready-to-run container for the [**H2**](https://www.h2database.com/html/quickstart.html) database. The image is based on a lightweight JRE and is configured with specific command-line options to run H2 in TCP mode together with a web console.

### Log Versions

- Image version 1.0 – H2 version 2.4.240.

### What This Container Does

This container sets up the H2 Database Engine, providing:

- A lightweight and fast in-memory or file-based database.
- Web-based administration interface accessible via HTTP.
- TCP server support for remote database connections.
- Support for various database modes including Oracle compatibility.

### Using Docker Compose (Recommended)

Create a `docker-compose.yml` file with the following content. These settings enable tracing, expose a web console, start a TCP server, and specify that all database files are stored under `/h2/data`:

```yaml
version: '3.8'
services:
  h2-database-engine:
    image: docker.io/eduardoenemark/h2-database-engine:1.0
    container_name: h2-database-engine
    restart: always
    ports:
      - "0.0.0.0:9092:9092/tcp"
      - "0.0.0.0:8082:8082/tcp"
    volumes:
      - ./h2-data:/h2/data
    command: [ "-trace", "-web", "-tcp", "-ifNotExists", "-webAllowOthers", "-tcpAllowOthers", "-baseDir", "/h2/data" ]
    deploy:
      resources:
        limits:
          cpus: 1
          memory: 512m
```

- The command are customs options to H2 Server.
- The volume mapping `./h2-data:/h2/data` stores all H2 database files on the host, ensuring persistence across container restarts.  
- Ports 9092 (TCP) and 8082 (web console) are exposed as shown.

**[Note]** This is an example configuration that demonstrates how to run the H2 database engine in a container. You should customize the image name, tag, and volume paths according to your specific requirements. The volume mapping `./h2-data:/h2/data` stores all database files on the host, so they remain available after container restarts.

**[Note]** Default options: `-trace -web -tcp -baseDir /h2/data/`.

### Persistence of Data

All database files are written to `/h2/data` inside the container; because this directory is mounted to `./h2-data` on the host, the data survive container restarts and can be backed up simply by copying that host folder.

### Connecting to the Database

**JDBC URL example**

```
jdbc:h2:tcp://localhost:9092/h2/data/<db-name>;MODE=<db-vendor>
```

Replace `<db-name>` with your database identifier, and replace `<db-vendor>`. This format is useful for applications that use JDBC drivers.

### Web Console

The web console can be accessed at:

```
http://localhost:8082
```

No user or password is configured in the example; you may adjust security settings as needed.

### Run the container

```bash
docker-compose up
```

### Command Line Using Podman

```bash
podman run -it --rm \
  --name h2-database-engine \
  -p 9092:9092/tcp \
  -p 8082:8082/tcp \
  -v $(pwd)/h2-data:/h2/data \
  docker.io/eduardoenemark/h2-database-engine:1.0 \
  -trace -web -tcp -ifNotExists -webAllowOthers -tcpAllowOthers -baseDir /h2/data
```

## License

This project is licensed under [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.html).
