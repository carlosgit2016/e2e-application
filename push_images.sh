#!/bin/bash

set -e

BRANCH_NAME=$1
DOCKER_HUB_REPOSITORY=$2

git_diff_name_only(){
    if [[ $BRANCH_NAME == 'main' ]]; then
        git diff --name-only --raw --no-color HEAD HEAD~1 | grep -io "^\w*-*\w*/" | sed 's/\///g' | sort | uniq
    else
        git diff --name-only --raw --no-color HEAD origin/main | grep -io "^\w*-*\w*/" | sed 's/\///g' | sort | uniq
    fi
}

get_commit_hash(){
    git log -1 --pretty=format:%h
}

docker_push(){
    local name=$1
    local tag=$2

    docker push "$DOCKER_HUB_REPOSITORY/$name:$tag"
}

main() {
    local directories=$(git_diff_name_only)
    # Pushing images using the same build logic
    # Folders that has Docker on it, then use the namem of the folder as the image
    for dir in $directories; do
        if [[ ! -e "$dir/Dockerfile" ]]; then
            echo "Ignoring $dir, not Dockerfile found"
            continue # Continue if Dockerfile wasn't found (Do not push the image)
        fi
        local tag

        if [[ $BRANCH_NAME == 'main' ]]; then
            tag='latest'
        else
            tag=$(get_commit_hash)
        fi

        echo "=================="
        echo "Pushing image $dir, tag $tag"
        docker_push $dir $tag 
        echo "=================="

    done
}

main