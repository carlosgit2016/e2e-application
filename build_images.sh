#!/bin/bash

set -e

BRANCH_NAME=$1

git_diff_name_only() {
    # Doing a git diff and looking for folders
    # Folders must contain a slash '/' in the end to indicate folder
    if [[ $BRANCH_NAME == 'main' ]]; then
        git diff --name-only --raw --no-color HEAD HEAD~1 | grep -io "^\w*-*\w*/" | sed 's/\///g' | sort | uniq
    else
        git diff --name-only --raw --no-color HEAD origin/main | grep -io "^\w*-*\w*/" | sed 's/\///g' | sort | uniq
    fi
    
}

docker_build() {
    local name=$1
    local tag=$2
    local context=$3
    local dockerfile=$4
    
    docker build -t $name:$tag -f $dockerfile $context
}

main() {
    local directories=$(git_diff_name_only)
    for dir in $directories; do
        # Checking if Dockerfile exists in folder
        if [[ -e "$dir/Dockerfile" ]]; then
            echo "========================="
            echo "Building image $dir"
            local name=$dir
            local tag=""
            # If main tag using latest
            # If not tag using the commit hash abbreviate
            if [[ $BRANCH_NAME == 'main' ]]; then
                tag='latest'
            else
                tag=$(git log -1 --pretty=format:%h)
            fi
            
            docker_build $name $tag $dir "$dir/Dockerfile"
            echo "========================="
        else
            echo "Ignoring $dir, Dockerfile not found..."
        fi
    done
}

main