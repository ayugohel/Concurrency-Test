# Concurrency Test

To complete this task, fill out the `loadMessage` method below this comment.

### Background

 There is  two data sources `fetchMessageOne` & `fetchMessageTwo` that load two parts of a messaage. These mimic loading data from the network and call their completion handlers in 0-2 seconds.
 
 ### Part 1
 
 This function should fetch both parts of the message (concurrently using GCD or OperationQueue) and join them with
 a space. e.g if `fetchMessageOne` completes with "Good" and `fetchMessageTwo` completes with "morning!" then loadMessage should call it's completion once with the String:
   "Good morning!"
 If loading either part of the message takes more than 2 seconds then `loadMessage` should complete with the String
   "Unable to load message - Time out exceeded"

 The function should only complete once and must always return the full message in the correct order.

 ###  Part 2

 Refactor this function to use idomatic Swift code.
 Follow the apple Swift naming guidelines. If you choose you can abstract classes, structs, protocols, enums, generics etc.

 ###  Part 3

 Refactor this function so it is easy to unit test.
 Write unit tests that verify both the successful loading & timeout behaviour. These tests must be deterministic.

 ###  Part 4
 * The completion handler should always be called on the main thread.
 * If loadMessage is called on the main thread, loadMessage should not block the main thread.
 
 
