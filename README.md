# Docker container for GroupSession, groupware

This is a private fork of the following repository:

- [poppen/dockerfile-groupsession](https://github.com/poppen/dockerfile-groupsession)

## Dev notes

```bat
docker build -t kenjiuno/groupsession:5.7.1 .
docker run -p 8080:8080 -it kenjiuno/groupsession:5.7.1
docker push kenjiuno/groupsession:5.7.1
```

Navigate to: http://127.0.0.1:8080/gsession/

`admin:admin`
