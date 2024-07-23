# README

Demo app for an application that subscribes to a central library in order to receive updated documents.

When a POST request is received to `/updates` a document will be created or updated.
- created in the database if a document record cannot be found that matches the token provided in the POST payload
- updated if the token in the payload matches a document in the database

This application uses HOTWIRE / broadcast_replace_to to automatically update the document preview (if it is an image) rather than requiring a page refresh to see the new document.
This feature requires redis to be running.

This application does not save document files at all. It saves a link to the document, and this link can be updated  by the process described above.
