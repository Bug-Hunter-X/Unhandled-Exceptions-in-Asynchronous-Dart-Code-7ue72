# Unhandled Exceptions in Asynchronous Dart Code

This repository demonstrates a common error in Dart: insufficient error handling in asynchronous operations. The `fetchData` function makes a network request and processes JSON, but its error handling is incomplete. This can lead to unexpected application behavior, such as silent failures or crashes.

The `bug.dart` file shows the problematic code. The `bugSolution.dart` file provides improved error handling.

## How to Reproduce

1. Clone this repository.
2. Run `bug.dart`. Observe that exceptions are printed to the console but not properly managed.
3. Run `bugSolution.dart` to see how robust error handling can prevent unexpected crashes.

## Solution

The improved error handling in `bugSolution.dart` includes:

* More specific exception handling (e.g., `FormatException` for JSON decoding errors).
* Returning a result indicating success or failure, allowing the calling code to handle the outcome gracefully.
* Providing informative error messages to aid debugging.