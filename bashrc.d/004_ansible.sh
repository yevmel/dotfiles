#!/bin/bash

initAnsibleRoles() {
    for role in "$@"; do
        mkdir -p "$role"/{files,templates,tasks,handlers,vars,defaults,meta}
    done
}

