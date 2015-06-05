function travis_get {
    travis logs $1 > /tmp/${1}.txt ; emacsclient -n /tmp/${1}.txt
}
