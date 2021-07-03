#!/usr/bin/env bash

isCommand() {
  for cmd in \
    "aliases" \
    "art" \
    "help" \
    "list" \
    "auth:login" \
    "auth:logout" \
    "auth:whoami" \
    "backup:automatic:disable" \
    "backup:automatic:enable" \
    "backup:automatic:info" \
    "backup:create" \
    "backup:get" \
    "backup:info" \
    "backup:list" \
    "backup:restore" \
    "branch:list" \
    "connection:info" \
    "connection:set" \
    "dashboard:view" \
    "domain:add" \
    "domain:dns" \
    "domain:list" \
    "domain:lookup" \
    "domain:primary:add" \
    "domain:primary:remove" \
    "domain:remove" \
    "env:clear-cache" \
    "env:clone-content" \
    "env:code-log" \
    "env:commit" \
    "env:deploy" \
    "env:diffstat" \
    "env:info" \
    "env:list" \
    "env:metrics" \
    "env:view" \
    "env:wake" \
    "env:wipe" \
    "https:info" \
    "https:remove" \
    "https:set" \
    "import:complete" \
    "import:database" \
    "import:files" \
    "import:site" \
    "lock:disable" \
    "lock:enable" \
    "lock:info" \
    "machine-token:delete" \
    "machine-token:delete-all" \
    "machine-token:list" \
    "multidev:create" \
    "multidev:delete" \
    "multidev:list" \
    "multidev:merge-from-dev" \
    "multidev:merge-to-dev" \
    "new-relic:disable" \
    "new-relic:enable" \
    "new-relic:info" \
    "org:list" \
    "org:people:add" \
    "org:people:list" \
    "org:people:remove" \
    "org:people:role" \
    "org:site:list" \
    "org:site:remove" \
    "org:upstream:list" \
    "owner:set" \
    "payment-method:add" \
    "payment-method:list" \
    "payment-method:remove" \
    "plan:info" \
    "plan:list" \
    "plan:set" \
    "redis:disable" \
    "redis:enable" \
    "remote:drush" \
    "remote:wp" \
    "self:clear-cache" \
    "self:config:dump" \
    "self:console" \
    "self:info" \
    "self:update" \
    "service-level:set" \
    "site:create" \
    "site:delete" \
    "site:info" \
    "site:list" \
    "site:lookup" \
    "site:org:add" \
    "site:org:list" \
    "site:org:remove" \
    "site:team:add" \
    "site:team:list" \
    "site:team:remove" \
    "site:team:role" \
    "site:upstream:clear-cache" \
    "site:upstream:set" \
    "solr:disable" \
    "solr:enable" \
    "ssh-key:add" \
    "ssh-key:list" \
    "ssh-key:remove" \
    "tag:add" \
    "tag:list" \
    "tag:remove" \
    "upstream:info" \
    "upstream:list" \
    "upstream:updates:apply" \
    "upstream:updates:list" \
    "upstream:updates:status" \
    "workflow:info:logs" \
    "workflow:info:operations" \
    "workflow:info:status" \
    "workflow:list" \
    "workflow:watch"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

# check if the first argument passed in looks like a flag
if [ "$(printf %c "$1")" = '-' ]; then
  set -- /tini -- terminus "$@"

# check if the first argument passed in is terminus
elif [ "$1" = 'terminus' ]; then
  set -- /tini -- "$@"

# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- /tini -- terminus "$@"
fi

exec "$@"
