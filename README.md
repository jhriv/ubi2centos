# UBI8 to CentOS

Using a base UBI8 (minimal) container, these Dockerfiles will convert them to
use CentOS repositories, allowing unfettered access to the sum of the Enterprise
Linux package base.

```bash
docker build .
docker build --file Dockerfile-minimal .
```
