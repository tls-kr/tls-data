# TLS-data
XML version of the TLS database. This is a companion app for the main [TLS](https://github.com/tls-kr/tls-app).

## Requirements
*   [exist-db](http://exist-db.org/exist/apps/homepage/index.html) version: ``3.6.1`` or greater
*   [ant](http://ant.apache.org) version: ``1.10.5`` \(for building from source\)

## Building and Installation
1.  Download, fork or clone this GitHub repository. Registered collaborators have access to the `translations` submodule. Collaborators should download *all* files.
    ```bash
    git clone --recursive https://github.com/tls-kr/tls-data.git
    ```

    All others:
    ```
    git clone https://github.com/tls-kr/tls-data.git
    ```

    If you cloned the repo before becoming a collaborator, or in case you forgot the `--recursive`, go to the `tls-data` directory on your local disk and issue:
    ```bash
    git submodule init
    git submodule update --remote
    ```

2.  There are two default build targets in ``build.xml``:
    *   ``full`` includes *all* files from the source folder including the translations.
    *   ``deploy`` is the official release. It excludes files from the `translations` submodule.
3.  Calling ``ant``in your CLI will build both files:  
    ```bash
    ant
    ```

    You should see `BUILD SUCCESSFUL`, and two `.xar` files inside the `build/` folder.
4.  Open the [dashboard](http://localhost:8080/exist/apps/dashboard/index.html) of your exist-db instance and click on `package manager`.
    1.  Click on the `add package` symbol in the upper left corner and select *one of the two* `.xar` files you just created.         

Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

