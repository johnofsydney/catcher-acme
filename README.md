# README

Demo app for an application that subscribes to a central library in order to receive updated documents.

When a POST request is received to `/updates` a document will be created or updated.
- created in the database if a document record cannot be found that matches the token provided in the POST payload
- updated if the token in the payload matches a document in the database

This application uses HOTWIRE, triggered from the Document model;
- the after_create action causes a broadcast_append_to to automatically add a row to the table of documents on the document index page
- the after_update action causes a broadcast_replace_to to automatically update the document preview (if it is an image) on the document show page
This feature requires redis to be running.

This application does not save the actual document binary files at all. It saves a link to the document, and this link can be updated  by the process described above.
