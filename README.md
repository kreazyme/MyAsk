## Expected:
- [ ] Apply Unit test
- [ ] Apply Dependency Injection
- [ ] Install Firebase Crashlytics
- [ ] Install Firebase Cloud Message
- [ ] Apply freezed

## BLoC
Apply BLoC Pattern in this project with ```bloc_flutter``` package

## Handle API
Using ```retrofit``` and ```json_serializable```

## Using CI/CD with Github Action and CodeMagic :sparkles:

## Clean Architecture
Apply Clean Architecture in this project. Here are Project Structure
```
├───data
│   ├───model
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
│   ├───repositories
│   └───usecases
│       ├───post
│       └───user
└───presentation
    ├───feature
    │   ├───Home
    │   │   └───bloc
    │   ├───Login
    │   │   └───bloc
    │   └───Register
    ├───resource
    └───widget
```
