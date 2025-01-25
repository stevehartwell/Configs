
# Regexes

split wordlist:

```sed
    s/^ {4}\|(.*\n( {4}\|.*\n){1,500})/!--
photon-reddit.com##ph-post:has(> a:matches-attr(href=/^\/r\/( \
    $1    )\//))
```

strip filters:

  1. `1,$s/^(?:[^ ]| {4}\)).*\n//`
  1. `1,$s/^ {4}\|?(.*) \\$/$1/`
