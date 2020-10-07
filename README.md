# UBI8 to CentOS

Using a base UBI8 (minimal) container, these Dockerfiles will convert them to
use CentOS repositories, allowing unfettered access to the sum of the Enterprise
Linux package base.

## With a [Red Hat Developer][D] account:

```bash
docker login registry.redhat.io
docker build .
docker build --file Dockerfile-minimal .
```

## Without a [Red Hat Developer][D] account:

```bash
docker build --build-arg registry=registry.access.redhat.com .
docker build --build-arg registry=registry.access.redhat.com --file Dockerfile-minimal .
```

### Note:

Red Hat is deprecating their unauthenticated registry service and [may be
discontinued at any time][A].

<!-- References -->
[D]: https://developers.redhat.com/
[A]: https://access.redhat.com/RegistryAuthentication
