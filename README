
## Steps

### Running the test from the shell works

bazel test --test_output=streamed //test

-> We expect to see a `ComparisonFailure`

### Running from within intellij fails

Importing the project in Intellij and then running `TestBase` will print the path of a log file containing:
```
1) initializationError(org.junit.runner.manipulation.Filter)
java.lang.Exception: No tests found matching RegEx[test.SomeTest#]
```
