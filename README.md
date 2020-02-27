# lumber-image

Image for Forest Admin Lumber backend generator

Official Lumber image for Forest Admin can be found at <https://hub.docker.com/r/forestadmin/lumber>

## Motivation

Official docker image firstly trying generate project on your system,
which you must use as back-end service.

But if you searching simple front-end admin panel for you database,
and don't want to store any back-end project,
you can use this image, for just simply start back-end for Forest Admin.

### Attention

This image generate Forest Admin project inside container then start it, it takes some time.
So you must build your system in understanding:
*"Just start admin backend once, on database start, and forgot about it"*

### Example

For start service from one command

```bash
docker run \
    -e DATABASE_SCHEMA="<your-database-schema>" \
    -e DATABASE_SSL="false" \
    -e DATABASE_URL="postgres://<root-username>:<root-user-password>@<database-host>:<database-port>/<database-name>" \
    -e APP_NAME="<application name>" \
    -e FOREST_EMAIL="example@mail.com" \
    -e FOREST_TOKEN="<forest-token>" \
    -e APPLICATION_HOST="localhost" \
    -e APPLICATION_PORT="3310" \
    -it leovs09/lumber
```

- `DATABASE_SCHEMA` - Your database schema.
- `DATABASE_SSL` - Use SSL for database connection (true | false).
- `DATABASE_URL` - The database credentials with a connection URL.
- `APP_NAME` - name of your application in forest admin.
- `FOREST_EMAIL` - Your Forest Admin account email.
- `FOREST_TOKEN` - Your Forest Admin account token.
- `APPLICATION_HOST` - Hostname of your admin backend application.
- `APPLICATION_PORT` - Port of your admin backend application.

Or through docker compose

```yml
# docker-compose.yml
version: "3"

services:
   admin:
      image: leovs09/lumber
      container_name: admin
      ports:
         - 3310:3310
      env_file:
         - ./.env.admin
```

### Contribut

To publish the docker image:

```bash
docker build -t leovs09/lumber .
docker push leovs09/lumber
```
