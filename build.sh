#!/bin/bash
set -x

# get changed files
FILES=$(git diff --diff-filter=M --name-only $TRAVIS_COMMIT_RANGE)
echo $FILES

# from changed files, construct list of those with tests
TEST_FILES=()
for rel_path in ${FILES[*]}
do
    # if the changed file has a corresponding test file we want to test it
    if [[ -f ${rel_path%.*}_tests.py ]]
    then
        TEST_FILES+=(${rel_path%.*}_tests.py)
    fi
done
echo $TEST_FILES

# run tests against files that have been changed AND have tests associated with them
for rel_path in ${TEST_FILES[*]}
do
  #set +e
  python -m pytest -v $rel_path
  #set -e
done