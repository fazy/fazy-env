A very hacky way to bump the CSS version. Bumps .css?v=n to .css?v=(n+1)

find . -type f | grep ".html$\|.php$\|.twig$" | grep -v 'cache/' | xargs perl -p -i -e 's/\.css\?v=(\d+)/\.css?v=@{[$1+1]}/g'

