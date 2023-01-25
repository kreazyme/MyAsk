## Expected:
- [ ] Apply Unit test
- [ ] Apply Dependency Injection
- [ ] Install Firebase Crashlytics
- [ ] Install Firebase Cloud Message
- [ ] Apply freezed

## BLoC
Apply BLoC Pattern in this project with ```bloc_flutter``` package

## Hive Database
Using Hive to save Token info

## Handle API
Using ```retrofit``` and ```json_serializable```

## Using ```go_router```
Generate dynamic link

## Using CI/CD with Github Action and CodeMagic :sparkles:

## Clean Architecture
Apply Clean Architecture in this project. Here are Project Structure
```
├───data
│   ├───local
│   ├───model
│   │   ├───DetailPost
│   │   ├───Post
│   │   └───User
│   │       ├───request
│   │       └───response
│   ├───repositories
│   └───services
├───domain
│   ├───entities
│   │   ├───comment
│   │   ├───post
│   │   └───user
│   ├───local
│   ├───repositories
│   └───usecases
│       ├───auth
│       ├───post
│       └───user
└───presentation
    ├───feature
    │   ├───Home
    │   │   └───bloc
    │   ├───Login
    │   │   └───bloc
    │   ├───Post
    │   │   └───bloc
    │   └───Register
    │       └───bloc
    ├───resource
    └───widget
```
