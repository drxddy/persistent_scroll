# Description

- Load ListWidget and run the app.
- Increment first list item by clicking it 3 times. Scroll to bottom and then scroll to top, the
  count will get reset

## Implementation

There are four solutions to this problem:

1. [list_one.dart](./lib/lists/list_one.dart): Simplest solution, but not efficient.
     - It adds `AutomaticKeepAliveClientMixin` to `ListItemWidget` to keep the state of the widget while scrolling.

2. [list_two.dart](./lib/lists/list_two.dart): Hoisted state to the parent `ListItemsTwo`.
     - This hoists the state of the `ListItemWidget` to the parent `ListWidget` and passes state updates to the child widget.
     - This is more efficient than the first solution as it doesn't keep the state of each widget.

3. [list_three.dart](./lib/lists/list_three.dart): Controller abstraction.
     - This uses `ChangeNotifierProvider` to manage the state of the list items.
     - This is more efficient than the second solution as it doesn't pass the state updates to the child widget.

4. [list_four.dart](./lib/lists/list_four.dart): improved controller & UX.
     - It makes the controller a singleton class as it's not necessary to create multiple instances of the controller.
     - It also improves the UX by giving option to reset state of all list items.


# Functional/Product Requirement

- There should be 100 list items, each should be set at 0 initially and user can increment its
  count.
- The count incremented by user should be persisted when he scrolls the list.

# Task:

- [x] Solve the functional requirement.
- [x] Review this file from Code Review perspective, list the issues and what changes should be made,
  perform the changes to the file.
- [x] Think of it as a intern checked in this code and as a senior has to code review and fix the code
  from implementation perspective to make it correct and efficient.
- [x] Send the fixed file back to the recruiter.